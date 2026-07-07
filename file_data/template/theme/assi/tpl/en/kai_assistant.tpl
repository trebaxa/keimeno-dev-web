<script>
var _kaiassi = (window._kaiassi = window._kaiassi || []);
_kaiassi.push(["eurl", "<%$eurl%>"]);
_kaiassi.push(["msg", "<%$plginopt.assi_msg|sthsc%>"]);
_kaiassi.push(["usage", "<%$plginopt.assi_usage|sthsc%>"]);
_kaiassi.push(["cont_matrix_id", "<%$cont_matrix_id%>"]);
</script>
<% if ($plginopt.assi_usage=='popup') %>
<div id="chat-container" class="chat-<%$plginopt.assi_usage%> <% $gbl_config.assi_position %>" role="dialog" aria-modal="true" aria-labelledby="chat-title" aria-describedby="js-thread-msgs" aria-hidden="true" style="display:none">
    <header class="chat-header">
        <h2 id="chat-title" class="chat-title"><%$plginopt.assi_title|default:'Chat'|sthsc%></h2>
        <button class="close-button" type="button" aria-label="Close chat dialog" title="Close chat" aria-controls="chat-container">X</button>
    </header>
    <div class="thread-msgs" id="js-thread-msgs" role="log" aria-live="polite" aria-relevant="additions text" aria-atomic="false">
        <div class="message assistant js-dsgvo" role="article" tabindex="0"><% $gbl_config.assi_dsgvo_text|nl2br %><a href="javascript:;" class="js-dsgvo-link dsgvo-link" role="link" title="<% $gbl_config.assi_dsgvo_link_text|sthsc %>" aria-label="<% $gbl_config.assi_dsgvo_link_text|sthsc %>"><% $gbl_config.assi_dsgvo_link_text|sthsc %></a></div>
    </div>
    <form action="<%$eurl%>" method="post" class="message-form" role="form" aria-labelledby="chat-title">
        <input type="hidden" name="cmd" value="push_prompt_to_assi" />
        <input type="hidden" name="cont_matrix_id" value="<%$cont_matrix_id%>">
        <input type="hidden" name="page" value="<%$page%>" />
        <input type="hidden" name="email" value="" />
        <input type="hidden" name="FORM[tid]" class="thread-id" value="" />
        <div class="input-groups">
            <label for="assi-input-popup" class="sr-only"><%$plginopt.assi_type_msg|sthsc%></label>
            <input id="assi-input-popup" type="text" class="message-input" required="" name="FORM[prompt]" placeholder="<%$plginopt.assi_type_msg|sthsc%>" aria-required="true" aria-label="<%$plginopt.assi_type_msg|sthsc%>" autocomplete="off" inputmode="text">
            <button class="send-button" type="submit" aria-label="Send message" title="<%$plginopt.assi_send_btn|st%>"><%$plginopt.assi_send_btn|st%> <span class="spinner" aria-hidden="true"></span></button>
        </div>
    </form>
</div>

<div id="chat-icon" class="<% $gbl_config.assi_position %>" role="button" tabindex="0" aria-label="<%$plginopt.assi_open_btn|default:'Open chat'|sthsc%>" title="<%$plginopt.assi_open_btn|default:'Open chat'|sthsc%>" aria-controls="chat-container" aria-expanded="false">
  <svg version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="300" height="300" viewBox="0 0 300 300" xml:space="preserve" aria-hidden="true" focusable="false">
    <path class="chat-icon-svg" d="M281.8,136.1c0,56.6-74.6,98.5-131.8,100.8c-16.5,0.6-30.3-2-40-4.7c-2.7,5-10.4,17.8-26.5,26
        c-19.5,9.9-38,6-42.9,4.8c4.2-3,13.7-10.5,19.1-23.8c3.6-9,4-17.1,3.8-21.9C56,212.4,43.2,203,33,186.7
        c-12.3-19.7-15-39.9-14.8-50.6C19.3,88.2,83.7,35.3,150,35.3C222.8,35.3,281.8,80.4,281.8,136.1z"/>.
  </svg>
️</div>

<%else%>
<section class="py-5" role="region" aria-labelledby="chat-title">
    <div class="container">
      <h2 id="chat-title">KI Assistant</h2>
      <div id="chat-container" class="chat-<%$plginopt.assi_usage%>" role="region" aria-labelledby="chat-title" aria-describedby="js-thread-msgs">
        <div class="thread-msgs" id="js-thread-msgs" role="log" aria-live="polite" aria-relevant="additions text" aria-atomic="false">
          <div class="message assistant js-dsgvo" role="article" tabindex="0"><% $gbl_config.assi_dsgvo_text|nl2br %><a href="javascript:;" class="js-dsgvo-link dsgvo-link" role="link" title="<% $gbl_config.assi_dsgvo_link_text|sthsc %>" aria-label="<% $gbl_config.assi_dsgvo_link_text|sthsc %>"><% $gbl_config.assi_dsgvo_link_text|sthsc %></a></div>
        </div>
        <form action="<%$eurl%>" method="post" class="message-form" role="form" aria-labelledby="chat-title">
          <input type="hidden" name="cmd" value="push_prompt_to_assi" />
          <input type="hidden" name="cont_matrix_id" value="<%$cont_matrix_id%>">
          <input type="hidden" name="email" value="" />
          <input type="hidden" name="page" value="<%$page%>" />
          <input type="hidden" name="FORM[tid]" class="thread-id" value="" />
          <div class="input-groups">
            <label for="assi-input-embed" class="sr-only"><%$plginopt.assi_type_msg|sthsc%></label>
            <input id="assi-input-embed" type="text" class="message-input" required="" name="FORM[prompt]" placeholder="<%$plginopt.assi_type_msg|sthsc%>" aria-required="true" aria-label="<%$plginopt.assi_type_msg|sthsc%>" autocomplete="off" inputmode="text">
            <button class="send-button" type="submit" aria-label="Send message" title="<%$plginopt.assi_send_btn|st%>"><%$plginopt.assi_send_btn|st%> <span class="spinner" aria-hidden="true"></span></button>
          </div>
        </form>
      </div>
    </div>
  </section>

<%/if%>