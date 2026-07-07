<% if ( isset($err_msgs) && is_array($err_msgs) && count($err_msgs)>0) %>
<div class="alert alert-danger" data-event="remove_onload" data-seconds="3" >
<%foreach from=$err_msgs item=msge %>
 <%$msge%><br>
<%/foreach%>
</div>
<%/if%>

<% if ( isset($ok_msgs) && is_array($ok_msgs) && count($ok_msgs)>0) %>
<div class="alert alert-success" data-event="remove_onload" data-seconds="3">
<%foreach from=$ok_msgs item=msg %>
 <%$msg%><br>
<%/foreach%>
</div>
<%/if%>