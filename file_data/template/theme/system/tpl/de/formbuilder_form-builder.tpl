<section id="formbuilder" class="white m-t-6">
  <div class="grid-container">
  
  <div class="grid-x grid-margin-y">
    <div class="cell">
      <div class="page-header m-b-3">
        <h2><%$FORMBUILDER.form.f_name%></h2>
      </div>
    </div>
  </div>
  
  <form action="<%$eurl%>" method="POST">
    <input type="hidden" name="cmd" value="send_form_build">
    <input type="hidden" name="page" value="<%$page%>">
    <input type="email" style="display:none" name="email" value="">
    <input type="hidden" name="cont_matrix_id" value="<%$cont_matrix_id%>">
  <% foreach from=$FORMBUILDER.steps item=step name=sloop %>
  
    <div data-stepname="<%$step.s_name|sthsc%>" class="step-<%$step.id%> step <% if ($smarty.foreach.sloop.first) %>active<%/if%>" id="step-<%$step.id%>" data-stepid="<%$step.id%>" data-next="<%$step.s_next%>" data-targets='<%$step.targets_json%>'>
    
        <div class="grid-x grid-margin-x grid-margin-y text-center">
          <div class="cell">
            <h3 class="m-b-2"><%$step.s_name%></h3>
            <span class="lead"><%$step.s_subtitle%></span>
            <%* $step|echoarr *%>
          </div>
        </div>
     
      <% foreach from=$step.opts item=opt %>
     <div class="grid-x grid-margin-x grid-margin-y js-optgroup align-center" id="optid-<%$opt.id%>" data-visible='<%$opt.visible_opts_json%>'>
        
        <!--<h4><%$opt.so_name%> <%$opt.so_type%></h4>-->
        <% if ($opt.so_type=='img') %>
          <% foreach from=$opt.so_data.values key=hash item=ov name=iloop %>
          <div class="cell small-12 medium-4 large-3 text-center">
            <figure class="thumbcheck js-fb-img-click<% if ($smarty.foreach.iloop.first) %> checked<%/if%>" data-hash="<%$hash%>" data-next="<%$ov.s_next|intval%>" data-optid="<%$opt.id%>" <% if ($smarty.foreach.iloop.first) %> data-checked="1" <%else%> data-checked="0" <%/if%>>
              <img src="<%$PATH_CMS%>file_data/formbuilder/<%$ov.pic_file%>" alt="img">
              <figcaption><%$ov.pic_label%></figcaption>
            </figure>
            <% if ($smarty.foreach.iloop.first) %> 
            <input type="hidden" id="js-img-value-<%$opt.id%>" name="FORM[data][<%$opt.so_name|st|regex_replace:'/[^a-zA-Z0-9]+/':'_'%>]" value="<%$ov.pic_label|sthsc%>">
          <%/if%>
          </div>
          <%/foreach%>
        <%/if%>
        
        <% if ($opt.so_type=='edt') %>
         <% if ( isset($opt.so_data.values) && is_array($opt.so_data.values) && count($opt.so_data.values)>1) %>
          <div class="cell small-12 medium-4 large-12">
            <div class="callout info">
              <h4><%$opt.so_name%></h4>
          <%/if%>    
               <% foreach from=$opt.so_data.values key=hash item=ov %>
                 <div class="cell small-12 medium-6 large-6">
                   <label for="opt-<%$opt.id%>"><%$ov.label%>
                     <input value="<%$ov.value|sthsc%>" data-hash="<%$hash%>" data-next="<%$ov.s_next|intval%>" data-optid="<%$opt.id%>" type="text" id="opt-<%$hash%>" name="FORM[<%$opt.so_name|st|regex_replace:'/[^a-zA-Z0-9]+/':'_'%>][<%$ov.label|sthsc%>]" placeholder="<%$ov.placeholder|sthsc%>" class="gf-form js-edit-field" <% if ($ov.required==1) %>data-required="1"<%else%>data-required="0"<%/if%>>
                   </label>
                 </div>
               <%/foreach%>
        <% if ( isset($opt.so_data.values) && is_array($opt.so_data.values) && count($opt.so_data.values)>1) %>       
            </div>   
          </div>   
          <%/if%>
        <%/if%>
        
        <% if ($opt.so_type=='txt') %>
         <% if ( isset($opt.so_data.values) && is_array($opt.so_data.values) && count($opt.so_data.values)>1) %>
          <div class="cell small-12 medium-4 large-12">
            <div class="callout info">
              <h4><%$opt.so_name%></h4>
          <%/if%>    
               <% foreach from=$opt.so_data.values key=hash item=ov %>
                 <div class="cell small-12 medium-6 large-6">
                   <label for="opt-<%$opt.id%>"><%$ov.label%>
                     <textarea rows="10" data-hash="<%$hash%>" data-next="<%$ov.s_next|intval%>" data-optid="<%$opt.id%>" type="text" id="opt-<%$hash%>" name="FORM[<%$opt.so_name|st|regex_replace:'/[^a-zA-Z0-9]+/':'_'%>][<%$ov.label|sthsc%>]" placeholder="<%$ov.placeholder|sthsc%>" class="gf-form js-edit-field" <% if ($ov.required==1) %>data-required="1"<%else%>data-required="0"<%/if%>><%$ov.value|sthsc%></textarea>
                   </label>
                 </div>
               <%/foreach%>
        <% if ( isset($opt.so_data.values) && is_array($opt.so_data.values) && count($opt.so_data.values)>1) %>       
            </div>   
          </div>   
          <%/if%>
        <%/if%>
        
       <% if ($opt.so_type=='sel') %>
          <div class="cell small-12 medium-6 large-6">
           <label for="opt-<%$opt.id%>"><%$opt.so_name%></label>
           <select data-visible='<%$opt.visible_opts_json%>' data-optid="<%$opt.id%>" name="FORM[<%$opt.so_name|st|regex_replace:'/[^a-zA-Z0-9]+/':'_'%>]" id="opt-<%$opt.id%>" class="gf-form js-sel-change">
             <% foreach from=$opt.so_data.values key=hash item=ov %>
               <option data-hash="<%$hash%>" data-next="<%$ov.s_next|intval%>" value="<%$ov.key%>"><%$ov.value%></option>
             <%/foreach%>
           </select>
         </div>
       <%/if%>

       <% if ($opt.so_type=='rad') %>
           <% foreach from=$opt.so_data.values key=hash item=ov %>
              <fieldset class="large-6 cell">
                <legend><%$opt.so_name%></legend>
                 <input class="js-radio" data-hash="<%$hash%>"  data-next="<%$ov.s_next|intval%>" id="opt-<%$opt.id%><%$ov.key|md5%>" data-optid="<%$opt.id%>" type="radio" name="FORM[<%$opt.so_name|st|regex_replace:'/[^a-zA-Z0-9]+/':'_'%>][<%$ov.key|sthsc%>]" value="<%$ov.value|sthsc%>">
                 <label for="opt-<%$opt.id%><%$ov.key|md5%>"><%$ov.key%></label>
             <%/foreach%>
             </fieldset>
       <%/if%>   
       
      <% if ($opt.so_type=='chk') %>
          <fieldset class="cell small-12">
            <legend><%$opt.so_name%></legend>
             <% foreach from=$opt.so_data.values key=hash item=ov %>
              <label for="opt-<%$opt.id%><%$ov.key|md5%>">
                <input class="js-chk <% if ( isset($opt.visible_opts) && is_array($opt.visible_opts) && count($opt.visible_opts)>0) %>js-chk-click<%/if%>" data-visible='<%$opt.visible_opts_json%>'  data-hash="<%$hash%>"  data-next="<%$ov.s_next|intval%>" id="opt-<%$opt.id%><%$ov.key|md5%>" data-optid="<%$opt.id%>" type="checkbox" name="FORM[<%$opt.so_name|st|regex_replace:'/[^a-zA-Z0-9]+/':'_'%>][<%$ov.key|sthsc%>]" value="<%$ov.value|sthsc%>">
                <span><%$ov.key%></span>
              </label>
         <%/foreach%>
          </fieldset>
       <%/if%>  
       
      <% if ($opt.so_type=='sld') %>
          
          <fieldset class="cell small-12">
            <legend><%$opt.so_name%></legend>
             <% foreach from=$opt.so_data.values key=hash item=ov %>
              <div class="grid-x grid-margin-x">
                <div class="cell small-10">
                  <label for=""><%$ov.label%></label>
                  <div class="slider" data-slider data-initial-start="<%$ov.from%>" data-step="<%$ov.step%>" data-end="<%$ov.to%>"  id="opt-cont-<%$opt.id%><%$ov.key|md5%>" data-visible='<%$opt.visible_opts_json%>'  data-hash="<%$hash%>"  data-next="<%$ov.s_next|intval%>" data-optid="<%$opt.id%>">
                    <span class="slider-handle" aria-controls="opt-<%$hash%>" data-slider-handle role="slider" tabindex="1"></span>
                    <span class="slider-fill" data-slider-fill></span>
                  </div>
              </div>    
              <div class="cell small-2">
                <input class="gf-form js-edit-field" id="opt-<%$hash%>" data-visible='<%$opt.visible_opts_json%>'  data-hash="<%$hash%>"  data-next="<%$ov.s_next|intval%>" data-optid="<%$opt.id%>" name="FORM[<%$opt.so_name|st|regex_replace:'/[^a-zA-Z0-9]+/':'_'%>][<%$ov.label|sthsc%>]" type="number" readonly="">
              </div>
              </div>
         <%/foreach%>
          </fieldset>
       <%/if%> 
       
       <% if ($opt.so_type=='upl') %>
       <fieldset class="cell small-12">
         <legend><%$opt.so_name%></legend>
         <% foreach from=$opt.so_data.values key=hash item=ov %>
          <div class="dropzonecsscsscsscsscsscsscss" id="drop-zone-files-<%$hash%>" style="line-height:30px;min-height:100px" data-visible='<%$opt.visible_opts_json%>'  data-hash="<%$hash%>"  data-next="<%$ov.s_next|intval%>">
                    <%$ov.label%><br><small>max. 7MB</small>
          </div>
          <div class="callout info">
            Maximale Anzahl Dateien: <%$ov.maxFiles%><br>
            Maximale Größe pro Datei: 7MB<br>
            Akzeptierte Datei Formate:<%$ov.acceptFiles%>
          </div>
          <div id="dropzonefeedback-<%$hash%>"></div>
                
        </fieldset>
                <script>
                $(document).ready(function() {
                    var notice_dropdown = new Dropzone("#drop-zone-files-<%$hash%>", {
                      paramName: "file",
                      clickable: true,
                      <% if ($maxFiles>0) %>maxFiles: <%$ov.maxFiles%>,
                      <%/if%>
                      acceptedFiles: "<%$ov.acceptFiles%>",
                      url:"/index.php?page=<% $page %>&cmd=fb_upload",
                      maxFilesize: 7
                    });
                    notice_dropdown.on("success", function(file,responseText) {
                        notice_dropdown.removeFile(file);
                        var result = jQuery.parseJSON(responseText);
                        if (result.status=='failed') {
                            $('#dropzonefeedback-<%$hash%>').append('<div class="callout red alert"><i class="fa fa-times"></i> '+result.filename+'</div>');
                        } else {
                            $('#dropzonefeedback-<%$hash%>').append('<div class="callout green success"><i class="fa fa-check-circle-o"></i> '+result.filename+'</div>');
                        }
                    });
                    notice_dropdown.on("drop", function() {
                         $('#dropzonefeedback-<%$hash%>').show();
                         $('#dropzonefeedback-<%$hash%>').css('opacity', '1');
                    });
                    notice_dropdown.on("queuecomplete", function() {
                         setTimeout("$('#dropzonefeedback-<%$hash%>').fadeOut()", 6000 );
                    });
                });
        
                </script>
                <%/foreach%>
       <%/if%>
        
      
      </div><!-- grid-x -->
   
      <%/foreach%>
        
      <div id="step-<%$step.id%>-dynamic"></div>
      
        <div class="grid-x grid-margin-x grid-margin-y">
          <div class="cell">
            <div class="button-group large m-t-3 align-justify">
              
              <div class="grid-x" style="width:100%">
              <% if (!$smarty.foreach.sloop.first) %>
              <div class="cell small-12 medium-6">
                <button class="button primary large js-fb-nav-back" data-back="0" type="button"><i class="fa fa-arrow-left"></i> zurück</button>
              </div>
              <%/if%>
            
              <div class="cell small-12<% if (!$smarty.foreach.sloop.first) %> medium-6 text-right<%/if%><% if ($smarty.foreach.sloop.first) %>medium-12 text-right<%/if%>">
                <% if ($step.s_last==1) %>
                  <button class="button secondary large" type="submit"><i class="fa fa-envelope"></i> absenden</button>
                <%else%>
                  <button class="button secondary large js-fb-nav-next" data-stepid="<%$step.id%>" data-next="<%$step.s_next%>" type="button"><i class="fa fa-arrow-right"></i> weiter</button>
                <%/if%>  
                <!-- <button type="button" class="js-test-click button" >test</button> -->
              </div>
              </div>
            </div>
          </div>
        </div>
      
    </div><!-- STEP <%$row.id%> -->
    
  <%/foreach%>
  </form>
  
  </div>
</section>

<style>
  .step {
    display:none;
  }

  .missing {
    border:3px solid #ff0000;
  }  
</style>