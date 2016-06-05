



<div class="fieldcontain ${hasErrors(bean: teamInstance, field: 'name', 'error')} ">
	<label for="name">
		<g:message code="team.name.label" default="Name" />
		
	</label>
	<g:textField name="name" value="${teamInstance?.name}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: teamInstance, field: 'baseLine', 'error')} required">
	<label for="baseLine">
		<g:message code="team.baseLine.label" default="Base Line" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="number" name="baseLine" required="" value="${fieldValue(bean: teamInstance, field: 'baseLine')}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: teamInstance, field: 'scope', 'error')} required">
	<label for="scope">
		<g:message code="team.scope.label" default="Scope" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="number" name="scope" required="" value="${fieldValue(bean: teamInstance, field: 'scope')}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: teamInstance, field: 'actual', 'error')} required">
	<label for="actual">
		<g:message code="team.actual.label" default="Actual" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="number" name="actual" required="" value="${fieldValue(bean: teamInstance, field: 'actual')}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: teamInstance, field: 'startDate', 'error')} required">
	<label for="startDate">
		<g:message code="team.startDate.label" default="Start Date" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="startDate" precision="day"  value="${teamInstance?.startDate}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: teamInstance, field: 'sprints', 'error')} ">
	<label for="sprints">
		<g:message code="team.sprints.label" default="Sprints" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${teamInstance?.sprints?}" var="s">
    <li><g:link controller="sprint" action="show" id="${s.id}">${s?.encodeAsHTML()}</g:link></li>
</g:each>

</ul>

</div>

