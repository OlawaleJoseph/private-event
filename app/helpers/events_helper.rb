module EventsHelper

  def check_errors(event)
    if event.errors.any?
      "<div>
      <h2><%= pluralize(@event.errors.count, 'error') %> prohibited this user from being saved:</h2>

      <ul>
        <% event.errors.full_messages.each do |message| %>
          <li><%= message %></li>
        <% end %>
      </ul>
    </div>".html_safe
    end
  end

  def display_attend_button(form)
    if current_user
      return form.submit "Attend"
     end
  end
end
