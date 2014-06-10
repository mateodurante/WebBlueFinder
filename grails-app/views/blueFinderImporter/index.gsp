
<%@ page import="webbluefinder.BlueFinderImporter" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'blueFinderImporter.label', default: 'BlueFinderImporter')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-blueFinderImporter" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-blueFinderImporter" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<th><g:message code="blueFinderImporter.scene.label" default="Scene" /></th>
					
						<g:sortableColumn property="processErrors" title="${message(code: 'blueFinderImporter.processErrors.label', default: 'Process Errors')}" />
					
						<g:sortableColumn property="dbFrom" title="${message(code: 'blueFinderImporter.dbFrom.label', default: 'Db From')}" />
					
						<g:sortableColumn property="dbTo" title="${message(code: 'blueFinderImporter.dbTo.label', default: 'Db To')}" />
					
						<g:sortableColumn property="overwrite" title="${message(code: 'blueFinderImporter.overwrite.label', default: 'Overwrite')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${blueFinderImporterInstanceList}" status="i" var="blueFinderImporterInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${blueFinderImporterInstance.id}">${fieldValue(bean: blueFinderImporterInstance, field: "scene")}</g:link></td>
					
						<td>${fieldValue(bean: blueFinderImporterInstance, field: "processErrors")}</td>
					
						<td>${fieldValue(bean: blueFinderImporterInstance, field: "dbFrom")}</td>
					
						<td>${fieldValue(bean: blueFinderImporterInstance, field: "dbTo")}</td>
					
						<td><g:formatBoolean boolean="${blueFinderImporterInstance.overwrite}" /></td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${blueFinderImporterInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>