

<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'sprint.label', default: 'Sprint')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-sprint" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
							</ul>
		</div>
		<div id="show-sprint" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list sprint">
			
				<g:if test="${sprintInstance?.index}">
				<li class="fieldcontain">
					<span id="index-label" class="property-label"><g:message code="sprint.index.label" default="Index" /></span>
					
						<span class="property-value" aria-labelledby="index-label"><g:fieldValue bean="${sprintInstance}" field="index"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${sprintInstance?.startDate}">
				<li class="fieldcontain">
					<span id="startDate-label" class="property-label"><g:message code="sprint.startDate.label" default="Start Date" /></span>
					
						<span class="property-value" aria-labelledby="startDate-label"><g:formatDate date="${sprintInstance?.startDate}" format="dd/MM/yyyy" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${sprintInstance?.endDate}">
				<li class="fieldcontain">
					<span id="endDate-label" class="property-label"><g:message code="sprint.endDate.label" default="End Date" /></span>
					
						<span class="property-value" aria-labelledby="endDate-label"><g:formatDate date="${sprintInstance?.endDate}" format="dd/MM/yyyy" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${sprintInstance?.baseLine}">
				<li class="fieldcontain">
					<span id="baseLine-label" class="property-label"><g:message code="sprint.baseLine.label" default="Base Line" /></span>
					
						<span class="property-value" aria-labelledby="baseLine-label"><g:fieldValue bean="${sprintInstance}" field="baseLine"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${sprintInstance?.scope}">
				<li class="fieldcontain">
					<span id="scope-label" class="property-label"><g:message code="sprint.scope.label" default="Scope" /></span>
					
						<span class="property-value" aria-labelledby="scope-label"><g:fieldValue bean="${sprintInstance}" field="scope"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${sprintInstance?.actual}">
				<li class="fieldcontain">
					<span id="actual-label" class="property-label"><g:message code="sprint.actual.label" default="Actual" /></span>
					
						<span class="property-value" aria-labelledby="actual-label"><g:fieldValue bean="${sprintInstance}" field="actual"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${sprintInstance?.actualVelocity}">
				<li class="fieldcontain">
					<span id="actualVelocity-label" class="property-label"><g:message code="sprint.actualVelocity.label" default="Actual Velocity" /></span>
					
						<span class="property-value" aria-labelledby="actualVelocity-label"><g:fieldValue bean="${sprintInstance}" field="actualVelocity"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${sprintInstance?.expectedVelocity}">
				<li class="fieldcontain">
					<span id="expectedVelocity-label" class="property-label"><g:message code="sprint.expectedVelocity.label" default="Expected Velocity" /></span>
					
						<span class="property-value" aria-labelledby="expectedVelocity-label"><g:fieldValue bean="${sprintInstance}" field="expectedVelocity"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${sprintInstance?.scopeIncrease}">
				<li class="fieldcontain">
					<span id="scopeIncrease-label" class="property-label"><g:message code="sprint.scopeIncrease.label" default="Scope Increase" /></span>
					
						<span class="property-value" aria-labelledby="scopeIncrease-label"><g:fieldValue bean="${sprintInstance}" field="scopeIncrease"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${sprintInstance?.team}">
				<li class="fieldcontain">
					<span id="team-label" class="property-label"><g:message code="sprint.team.label" default="Team" /></span>
					
						<span class="property-value" aria-labelledby="team-label"><g:link controller="team" action="show" id="${sprintInstance?.team?.id}">${sprintInstance?.team?.name}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${sprintInstance?.id}" />
					<g:link class="edit" action="edit" id="${sprintInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
