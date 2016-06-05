



<div class="fieldcontain ${hasErrors(bean: sprintInstance, field: 'index', 'error')} ">
	<g:field type="hidden" disabled="true"  name="index"  value="${fieldValue(bean: sprintInstance, field: 'index')}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: sprintInstance, field: 'startDate', 'error')} required">
	<label for="startDate">
		<g:message code="sprint.startDate.label" default="Start Date" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="startDate" precision="day"  value="${sprintInstance?.startDate}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: sprintInstance, field: 'endDate', 'error')} required">
	<label for="endDate">
		<g:message code="sprint.endDate.label" default="End Date" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="endDate" precision="day"  value="${sprintInstance?.endDate}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: sprintInstance, field: 'baseLine', 'error')} ">
	<g:field type="hidden" name="baseLine"  value="${fieldValue(bean: sprintInstance, field: 'baseLine')}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: sprintInstance, field: 'scope', 'error')} ">

	<g:field type="hidden" name="scope"  value="${fieldValue(bean: sprintInstance, field: 'scope')}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: sprintInstance, field: 'actual', 'error')} ">
	<g:field type="hidden" name="actual"  value="${fieldValue(bean: sprintInstance, field: 'actual')}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: sprintInstance, field: 'actualVelocity', 'error')} required">
	<label for="actualVelocity">
		<g:message code="sprint.actualVelocity.label" default="Actual Velocity" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="number" name="actualVelocity" required="" value="${fieldValue(bean: sprintInstance, field: 'actualVelocity')}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: sprintInstance, field: 'expectedVelocity', 'error')} required">
	<label for="expectedVelocity">
		<g:message code="sprint.expectedVelocity.label" default="Expected Velocity" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="number" name="expectedVelocity" required="" value="${fieldValue(bean: sprintInstance, field: 'expectedVelocity')}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: sprintInstance, field: 'scopeIncrease', 'error')} required">
	<label for="scopeIncrease">
		<g:message code="sprint.scopeIncrease.label" default="Scope Increase" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="number" name="scopeIncrease" required="" value="${fieldValue(bean: sprintInstance, field: 'scopeIncrease')}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: sprintInstance, field: 'team', 'error')} required">
	<label >
		<g:message code="sprint.team.label" default="Team" />
		<span class="required-indicator">*</span>
	</label>
    <g:field type="hidden" name="team.id"  value="${sprintInstance?.team?.id}"/>
    <g:field type="label" disabled="true"  name="team.id"  value="${sprintInstance?.team?.name}"/>

</div>

