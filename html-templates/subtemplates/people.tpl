{load_templates subtemplates/personName.tpl}

{template avatar Person size=32 pixelRatio=2 urlOnly=false forceSquare=true}
    {$pixels = $size}
    {if $pixelRatio}
        {$pixels = $size * $pixelRatio}
    {/if}
    {if $Person->PrimaryPhoto}
        {$src = $Person->PrimaryPhoto->getThumbnailRequest($pixels, $pixels, null, $forceSquare)}
    {elseif $Person->Email}
        {$src = cat("//www.gravatar.com/avatar/", md5(strtolower($Person->Email)), "?s=", $pixels, "&r=g&d=mm")}
    {/if}

    {if $urlOnly}{strip}
        $src
    {/strip}{else}{strip}
        <img alt="{personName $Person}" src="{$src}" class="avatar" width="{$size}">
    {/strip}{/if}
{/template}

{template personLink Person photo=no photoSize=64 pixelRatio=2 summary=no}{strip}
    {if $Person}
        <a href="{$Person->getURL()}" title="{personName $Person summary=yes}">
            {if $photo}
                {avatar $Person size=$photoSize pixelRatio=$pixelRatio}
            {/if}
            <span class="name">{personName $Person summary=$summary}</span>
        </a>
    {else}
        <em class="anonymous">Anonymous</em>
    {/if}
{/strip}{/template}