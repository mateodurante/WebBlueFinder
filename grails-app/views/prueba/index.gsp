
<%@ page import="webbluefinder.Prueba" %>
<!DOCTYPE html>
<html>

<head>
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'prueba.label', default: 'Prueba')}" />
	<title><g:message code="default.index.label" args="[entityName]" /></title>
</head>

<body>

<section id="index-prueba" class="first">

	<table class="table table-bordered margin-top-medium">
		<thead>
			<tr>
			
			</tr>
		</thead>
		<tbody>
		<g:each in="${pruebaInstanceList}" status="i" var="pruebaInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
			
			</tr>
		</g:each>
		</tbody>
	</table>
	<div>
		<bs:paginate total="${pruebaInstanceCount}" />
	</div>
</section>

</body>

</html>
