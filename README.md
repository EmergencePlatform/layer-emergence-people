# layer-people
User and people's models

## Add user tools to site design

In `html-templates/designs/site.tpl` add the `user-tools` block below.

```html
<header class="header site clearfix">
    <div class="inner">
    {block "user-tools"}
        {include includes/site.user-tools.tpl}
    {/block}
    ...
</header>
```