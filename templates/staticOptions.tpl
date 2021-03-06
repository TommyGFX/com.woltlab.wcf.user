{include file='documentHeader'}

<head>
	<title>{lang}wcf.user.staticOptions.title{/lang}</title>
	{include file='headInclude' sandbox=false}
	
	<script type="text/javascript">
		//<![CDATA[
		$(function() {
			WCF.TabMenu.init();
		});
		//]]>
	</script>
</head>

<body id="tpl{$templateName|ucfirst}">

{include file='profileEditSidebar' sandbox=false}

{include file='header' sandbox=false sidebarOrientation='left'}

<header class="box48 boxHeadline">
	<img src="{icon size='L'}users1{/icon}" alt="" class="icon48" />
	<hgroup>
		<h1>{lang}wcf.user.staticOptions.title{/lang}</h1>
	</hgroup>
</header>

{if $success|isset}
	<p class="success">{lang}wcf.global.form.success{/lang}</p>	
{/if}

<form method="post" action="{link controller='StaticOptions'}{/link}">
	<div class="tabMenuContainer" data-active="" data-store="activeTabMenuItem">
		<nav class="tabMenu">
			<ul>
				<li><a href="#general">{lang}wcf.user.staticOptions.category.general{/lang}</a></li>
				<li><a href="#display">{lang}wcf.user.staticOptions.category.display{/lang}</a></li>
			</ul>
		</nav>
		
		<div id="general" class="tabMenuContainer container containerPadding shadow tabMenuContent">
			<hgroup class="boxSubHeadline">
				<h1>{lang}wcf.user.staticOptions.category.general{/lang}</h1>
			</hgroup>
			
			<fieldset>
				<legend>{lang}wcf.user.staticOptions.language{/lang}</legend>
				
				<dl>
					<dt><label for="languageID">{lang}wcf.user.staticOptions.language{/lang}</label></dt>
					<dd>
						<select id="languageID" name="languageID">
							{foreach from=$availableLanguages item=language}
								<option value="{@$language->languageID}"{if $language->languageID == $languageID} selected="selected"{/if}>{$language}</option>
							{/foreach}
						</select>
					</dd>
				</dl>
				
				{hascontent}
					<dl>
						<dt><label>{lang}wcf.user.staticOptions.contentLanguages{/lang}</label></dt>
						{content}
							{foreach from=$availableContentLanguages item=language}
								<dd>
									<label><input name="contentLanguageID[]" type="checkbox" value="{@$language->languageID}"{if $language->languageID|in_array:$contentLanguageIDs} checked="checked"{/if} /> {$language}</label>
								</dd>
							{/foreach}
						{/content}
					</dl>
				{/hascontent}
			</fieldset>
		</div>
		
		<div id="display" class="tabMenuContainer container containerPadding shadow tabMenuContent">
			<hgroup class="boxSubHeadline">
				<h1>{lang}wcf.user.staticOptions.category.display{/lang}</h1>
			</hgroup>
			
			<fieldset>
				<legend>{lang}wcf.user.staticOptions.style{/lang}</legend>
				
				<dl>
					<dt><label for="styleID">{lang}wcf.user.staticOptions.style{/lang}</label></dt>
					<dd>
						<!-- TODO: Add some fancy JavaScript to display preview images, this should be common enough to use it in boardAdd.tpl too! -->
						<select id="styleID" name="styleID">
							<option value="0"></option>
							{foreach from=$availableStyles item=style}
								<option value="{@$style->styleID}"{if $style->styleID == $styleID} selected="selected"{/if}>{$style->styleName}</option>
							{/foreach}
						</select>
					</dd>
				</dl>
			</fieldset>
		</div>
	</div>
	
	<div class="formSubmit">
		<input type="submit" value="{lang}wcf.global.button.submit{/lang}" accesskey="s" />
	</div>
</form>

{include file='footer' sandbox=false}

</body>
</html>
