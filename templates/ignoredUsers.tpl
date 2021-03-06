{include file='documentHeader'}

<head>
	<title>{lang}wcf.user.ignoredUsers.title{/lang}</title>
	{include file='headInclude' sandbox=false}
	
	<script type="text/javascript">
		//<![CDATA[
		$(function() {
			new WCF.Action.Delete('wcf\\data\\user\\ignore\\UserIgnoreAction', $('.jsIgnoredUser'), $('.jsIgnoredUsersBadge'));
		});
		//]]>
	</script>
	{*TODO: css*}
	<style type="text/css">
		#ignoredUsersList li {
			display: inline-block;
			position: relative;
		}
		
		#ignoredUsersList span {
			opacity: 0;
			position: absolute;
			right: 2px;
			top: 2px;
		
			-o-transition: opacity .2s ease 0;
		}
		
		#ignoredUsersList li:hover span {
			opacity: 1;
		}
		
		#ignoredUsersList span > img {
			border-bottom-left-radius: 5px;
		}
	</style>
</head>

<body id="tpl{$templateName|ucfirst}">

{include file='profileEditSidebar' sandbox=false}

{include file='header' sandbox=false sidebarOrientation='left'}

<header class="box48 boxHeadline">
	<img src="{icon size='L'}users1{/icon}" alt="" class="icon48" />
	<hgroup>
		<h1>{lang}wcf.user.ignoredUsers.title{/lang} <span class="badge jsIgnoredUsersBadge">{#$count}</span></h1>
	</hgroup>
</header>

<section id="ignoredUsersList">
	{hascontent}
		<ul>
			{content}
				{foreach from=$ignoredUsers item=ignoredUser}
					<li class="framed jsIgnoredUser">
						<div title="{$ignoredUser->username}" class="jsTooltip">
							<span><img src="{icon size='S'}delete1{/icon}" alt="" class="jsDeleteButton" data-object-id="{@$ignoredUser->ignoreUserID}" /></span>
							<a href="{link controller='User' id=$ignoredUser->ignoreUserID}{/link}">
								{@$ignoredUser->getAvatar()->getImageTag(64)}
							</a>
						</div>
					</li>
				{/foreach}
			{/content}
		</ul>
	{hascontentelse}
		<!-- TODO: What should we display here? -->
		<p class="info">You do not ignore any users yet</p>
	{/hascontent}
</section>

{include file='footer' sandbox=false}

</body>
</html>
