

<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'team.label', default: 'Team')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-team" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-team" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list team">

				<g:if test="${teamInstance?.name}">
				<li class="fieldcontain">
					<span id="name-label" class="property-label"><g:message code="team.name.label" default="Name" /></span>

						<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${teamInstance}" field="name"/></span>

				</li>
				</g:if>

				<g:if test="${teamInstance?.baseLine}">
				<li class="fieldcontain">
					<span id="baseLine-label" class="property-label"><g:message code="team.baseLine.label" default="Base Line" /></span>

						<span class="property-value" aria-labelledby="baseLine-label"><g:fieldValue bean="${teamInstance}" field="baseLine"/></span>

				</li>
				</g:if>

				<g:if test="${teamInstance?.scope}">
				<li class="fieldcontain">
					<span id="scope-label" class="property-label"><g:message code="team.scope.label" default="Scope" /></span>

						<span class="property-value" aria-labelledby="scope-label"><g:fieldValue bean="${teamInstance}" field="scope"/></span>

				</li>
				</g:if>

				<g:if test="${teamInstance?.actual}">
				<li class="fieldcontain">
					<span id="actual-label" class="property-label"><g:message code="team.actual.label" default="Actual" /></span>

						<span class="property-value" aria-labelledby="actual-label"><g:fieldValue bean="${teamInstance}" field="actual"/></span>

				</li>
				</g:if>

				<g:if test="${teamInstance?.startDate}">
				<li class="fieldcontain">
					<span id="startDate-label" class="property-label"><g:message code="team.startDate.label" default="Start Date" /></span>

						<span class="property-value" aria-labelledby="startDate-label"><g:formatDate date="${teamInstance?.startDate}" format="dd-MM-yyyy"/></span>

				</li>
				</g:if>

				<g:if test="${teamInstance?.sprints}">
				<li class="fieldcontain">
					<span id="sprints-label" class="property-label"><g:message code="team.sprints.label" default="Sprints" /></span>

						<g:each in="${teamInstance.sprints}" var="s">
						<span class="property-value" aria-labelledby="sprints-label"><g:link controller="sprint" action="show" id="${s.id}">Sprint ${s?.index}</g:link></span>
						</g:each>

				</li>
				</g:if>

			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${teamInstance?.id}" />
					<g:link class="edit" action="edit" id="${teamInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
                    <g:link controller="sprint" action="create" params="['team.id': teamInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'sprint.label', default: 'Sprint')])}</g:link>
                    <g:link controller="Sprint" action="draw" params="[id:teamInstance?.id]">Draw chart like image</g:link></li>
                    <g:link controller="Sprint" action="drawSvg" params="[id:teamInstance?.id]">Draw chart like SVG</g:link></li>
                </fieldset>
			</g:form>


		</div>
	</body>
</html>
