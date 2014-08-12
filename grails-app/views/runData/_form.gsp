<%@ page import="runningmapv2.RunData" %>



<div class="fieldcontain ${hasErrors(bean: runDataInstance, field: 'datetime', 'error')} required">
	<label for="datetime">
		<g:message code="runData.datetime.label" default="Datetime" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="datetime" precision="day"  value="${runDataInstance?.datetime}"  />

</div>

<div class="fieldcontain ${hasErrors(bean: runDataInstance, field: 'parsedGPX', 'error')} ">
	<label for="parsedGPX">
		<g:message code="runData.parsedGPX.label" default="Parsed GPX" />
		
	</label>
	

</div>

<div class="fieldcontain ${hasErrors(bean: runDataInstance, field: 'gpxData', 'error')} required">
	<label for="gpxData">
		<g:message code="runData.gpxData.label" default="Gpx Data" />
		<span class="required-indicator">*</span>
	</label>
	<input type="file" id="gpxData" name="gpxData" />

</div>

