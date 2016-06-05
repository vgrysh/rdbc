

<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'sprint.label', default: 'Sprint')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-sprint" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-sprint" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="index" title="${message(code: 'sprint.index.label', default: 'Index')}" />
					
						<g:sortableColumn property="startDate" title="${message(code: 'sprint.startDate.label', default: 'Start Date')}" />
					
						<g:sortableColumn property="endDate" title="${message(code: 'sprint.endDate.label', default: 'End Date')}" />
					
						<g:sortableColumn property="baseLine" title="${message(code: 'sprint.baseLine.label', default: 'Base Line')}" />
					
						<g:sortableColumn property="scope" title="${message(code: 'sprint.scope.label', default: 'Scope')}" />
					
						<g:sortableColumn property="actual" title="${message(code: 'sprint.actual.label', default: 'Actual')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${sprintInstanceList}" status="i" var="sprintInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${sprintInstance.id}">${fieldValue(bean: sprintInstance, field: "index")}</g:link></td>

						<td><g:formatDate date="${sprintInstance.startDate}" format="dd/MM/yyyy"/></td>
					
						<td><g:formatDate date="${sprintInstance.endDate}" format="dd/MM/yyyy"/></td>
					
						<td>${fieldValue(bean: sprintInstance, field: "baseLine")}</td>
					
						<td>${fieldValue(bean: sprintInstance, field: "scope")}</td>
					
						<td>${fieldValue(bean: sprintInstance, field: "actual")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${sprintInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
