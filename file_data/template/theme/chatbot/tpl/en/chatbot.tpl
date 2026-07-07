<script>
  var _chatbot = {
    eurl: "<%$eurl%>",
    page: "<%$page|intval%>",
    cmid: "<%$plginopt.cont_matrix_id|intval%>",
    readtext: false,
    start_dialoge: "<%$plginopt.start_dialoge|sthsc%>",
    spinner: '<div class="spinner-row js-my-spinner"><div class="bot-spinner" role="status"></div></div>'
  }
  </script>

  <section class="mb-3">
    <div class="container">
      <h2><%$plginopt.title%></h2>
      <div class="row">
        <div class="col-md-12">
          <div class="chat-container">
            <div class="mb-3 mt-3" id="chat-box">
              <% foreach from=$CHATBOT.conversation item=row name=cloop %>
              <div class="message <%$row.role%>"><%$row.content%></div>
              <%/foreach%>
            </div>
            <div class="input-group">
              <input type="text" id="user-input" class="form-control" required="" placeholder="Type a message...">
              <div class="input-group-append">
                <button id="send-button" type="button" class="btn btn-primary">Send</button>
              </div>
            </div>
          </div>
        </div>

      </div>
    </div>
  </section>