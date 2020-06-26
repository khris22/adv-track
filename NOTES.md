Generate Random quote from Users:
views/sessions/home.html.erb
<center><p>TrekIt user <strong><%= @random_adventure.user.username %>
</strong> says "<%= @random_adventure.name %>: <%= @random_adventure.recommendation %>" </p></center>


# Plans
    After MVP for Project Requirements, work on:
        - show on nested route - DONE
        - scope methods
        - add categories & scope on categories (e.g. hiking, camoing)
        - add bootsrap styling
        - add & learn 'devise'
        - date -when updated show on top-