
<%@ page import="runningmapv2.RunData" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'runData.label', default: 'RunData')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-runData" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-runData" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list runData">
			
				<g:if test="${runDataInstance?.datetime}">
				<li class="fieldcontain">
					<span id="datetime-label" class="property-label"><g:message code="runData.datetime.label" default="Datetime" /></span>
					
						<span class="property-value" aria-labelledby="datetime-label"><g:formatDate date="${runDataInstance?.datetime}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${runDataInstance?.parsedGPX}">
				<li class="fieldcontain">
					<span id="parsedGPX-label" class="property-label"><g:message code="runData.parsedGPX.label" default="Parsed GPX" /></span>
					
						<span class="property-value" aria-labelledby="parsedGPX-label"><g:fieldValue bean="${runDataInstance}" field="parsedGPX"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${runDataInstance?.gpxData}">
				<li class="fieldcontain">
					<span id="gpxData-label" class="property-label"><g:message code="runData.gpxData.label" default="Gpx Data" /></span>
					
				</li>
				</g:if>
                <g:link class="map" action="map" resource="${runDataInstance}"><g:message code ="default.button.map.label" default="Show Map"/></g:link>
			</ol>
			<g:form url="[resource:runDataInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${runDataInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
