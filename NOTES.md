##User Interaction

- If you are going to create a fancy splash page, you need to fill it with content. Lorem Ipsum is a place holder.  Project deliverables require real copy.

- I created a user account, then created a project. I click on the show page, choose `Generate workflow`, and get an error:

Browser error:

```bash
NoMethodError in SessionsController#show
undefined method `/' for nil:NilClass
```

Terminal error:

```bash
app/controllers/sessions_controller.rb:162:in `total_time'
app/controllers/sessions_controller.rb:102:in `show'
```

- I clicked on the `Staff` link on the left and I see  `Developers#index\` without any other information. If I don't have any staff yet consider creating a more helpful message.

- In your skills page your background turns into a repeating background that makes it impossible to read. Consider creating individual cards for each element in your skill list.  That way you can keep your fancy background and have things readable.  Consider adding fields to your skills such as doc links, current version, a logo, etc.

![](/imgs/hiddentext.png)

- When I click on a particular skill I see

```
This is show.html from skills controller
JQuery
```

This is not helpful. Also, should I be able to edit a skill? And delete a skill?  You have an Add skill button, but it's too close to your skills list so it took me a couple runs through your site to see it.


At 100% zoom level on your team/new view your form is cut off.

![](/imgs/cantseeform.png)

- I just created two more developers. why can't I see them in the `Developer#index` page?

- Upon inspection in the rails console subsequent developers are not actually created. Only one developer can be made at a time?

- Also, there is a 500 limit to salary? That's not cool.


- Your views have a LOT of repitition of your sidebar:

```html
  <div id="wrapper">
      <div id="sidebar-wrapper">
          <ul class="sidebar-nav">
              <li class="sidebar-brand"> </li>
              <li><strong><%= link_to "Dashboard", profile_path %></strong></li>
              <li><strong><%= link_to "Staff", devs_path %></strong></li>
              <li><strong><%= link_to "Skills", skills_path %></strong></li>
          </ul>
      </div>
  </div>
```

Put this into a partial and call it where needed. Bam. Just cut each doc's line count by 10.
