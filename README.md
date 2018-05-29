# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...


        <%= content_tag(:strong, "Either select an instructor or add a new one (below):") %>

        <%= instructor.collection_check_boxes(:instructor_ids, Instructor.all, :id, :second_name) do |b| %>
          <br><%= b.label(class: "label-checkbox") { b.check_box + b.object.second_name}%>
        <% end %>
