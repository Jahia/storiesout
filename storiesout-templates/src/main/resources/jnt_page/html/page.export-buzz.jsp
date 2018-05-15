<!doctype html>
<html lang="en">
<%@ page language="java" contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="template" uri="http://www.jahia.org/tags/templateLib" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="jcr" uri="http://www.jahia.org/tags/jcr" %>
<%@ taglib prefix="query" uri="http://www.jahia.org/tags/queryLib" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%--@elvariable id="currentNode" type="org.jahia.services.content.JCRNodeWrapper"--%>
<%--@elvariable id="out" type="java.io.PrintWriter"--%>
<%--@elvariable id="script" type="org.jahia.services.render.scripting.Script"--%>
<%--@elvariable id="scriptInfo" type="java.lang.String"--%>
<%--@elvariable id="workspace" type="java.lang.String"--%>
<%--@elvariable id="renderContext" type="org.jahia.services.render.RenderContext"--%>
<%--@elvariable id="currentResource" type="org.jahia.services.render.Resource"--%>
<%--@elvariable id="url" type="org.jahia.services.render.URLGenerator"--%>
<c:set var="buzzImagePath" value="/files/default/sites/storiesout/files/adf/"/>
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.16/css/jquery.dataTables.css">
    <!-- Optional JavaScript -->


    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>


    <script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.10.16/js/jquery.dataTables.js"></script>

    <script type="text/javascript" src="https://cdn.datatables.net/buttons/1.5.1/js/dataTables.buttons.min.js"></script>
    <script type="text/javascript" src="https://cdn.datatables.net/buttons/1.5.1/js/buttons.flash.min.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jszip/3.1.3/jszip.min.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.32/pdfmake.min.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.32/vfs_fonts.js"></script>
    <script type="text/javascript" src="https://cdn.datatables.net/buttons/1.5.1/js/buttons.html5.min.js"></script>
    <script type="text/javascript" src="https://cdn.datatables.net/buttons/1.5.1/js/buttons.print.min.js"></script>
    <title>Buzz</title>
</head>
<body>
<h1>Buzz</h1>
<div class="container">
    <div class="row">
        <div class="col">
            <jcr:jqom var="newses">
                <query:selector nodeTypeName="sont:buzz" selectorName="stmp"/>
                <query:descendantNode path="${renderContext.site.path}/home/resultats" selectorName="stmp"/>
            </jcr:jqom>
            <table class="table table-striped" id="myTable">
                <thead>
                    <tr>
                        <th>date</th>
                        <th>buzz UUID</th>
                        <th>client</th>
                        <th>client UUID</th>
                        <th>author</th>
                        <%--<th>image</th>--%>
                        <th>title</th>
                        <th>text</th>
                        <th>link</th>
                        <th>language</th>
                        <th>campaign</th>
                    </tr>
                </thead>

                <tbody>
                    <c:forEach items="${newses.nodes}" var="news">
                        <tr>

                            <td>
                                <c:set var="date" value="${news.properties.date.time}"/>
                                <c:set var="language" value="${currentResource.locale.language}"/>
                                <fmt:setLocale value="${language}" scope="session"/>
                                <fmt:formatDate value="${date}" pattern="dd/MM/yyyy" var="formatedDate"/>
                                ${formatedDate}
                            </td>
                            <td>
                                    ${news.identifier}
                            </td>
                            <td>
                                <c:forEach items="${news.properties.relatedClient}" var="relatedClient" varStatus="sta">
                                    <c:if test="${! sta.first}">, </c:if>${relatedClient.node.displayableName}
                                </c:forEach>
                            </td>
                            <td>
                                <c:forEach items="${news.properties.relatedClient}" var="relatedClient" varStatus="sta">
                                    <c:if test="${! sta.first}">, </c:if>${relatedClient.node.identifier}
                                </c:forEach>
                            </td>
                            <td>${news.properties.author.string}</td>
                            <%--
                            <td>
                                <c:set var="logoPath" value=""/>
                                <c:set var="image" value="${buzz.properties.image.node}"/>
                                <c:if test="${! empty image}">
                                    <c:url var="imagePath" value="${image.url}"/>
                                </c:if>
                                    ${fn:replace(imagePath, buzzImagePath, '')}
                            </td>
                            --%>
                            <td>${fn:escapeXml(news.displayableName)}</td>
                            <td>${fn:escapeXml(news.properties.text.string)}</td>
                            <td>
                                <c:set var="linkUrl" value="#"/>
                                <c:set var="linkType" value="noLink"/>
                                <c:if test="${jcr:isNodeType(news, 'somix:link')}">
                                    <c:set var="linkType" value="${news.properties['linkType'].string}"/>
                                    <c:choose>
                                        <c:when test="${linkType == 'internal'}">
                                            <c:set var="linkNode" value="${news.properties.internalLink.node}"/>
                                            <c:url var="linkUrl" value="${linkNode.url}"/>
                                        </c:when>
                                        <c:when test="${linkType == 'file'}">
                                            <c:set var="linkNode" value="${news.properties.fileLink.node}"/>
                                            <c:url var="linkUrl" value="${linkNode.url}"/>
                                        </c:when>
                                        <c:when test="${linkType == 'external'}">
                                            <c:set var="linkUrl" value="${news.properties.externalLink.string}"/>
                                        </c:when>
                                    </c:choose>
                                    ${linkUrl}
                                </c:if>
                            </td>
                            <td>${news.properties.language.string}</td>
                            <td>
                                <c:forEach items="${news.properties.relatedCampaign}" var="relatedCampaign" varStatus="sta">
                                    <c:if test="${! sta.first}">, </c:if>${relatedCampaign.node.displayableName}
                                </c:forEach>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</div>
<script>
    $('#myTable').DataTable( {
        "paging":false,
        dom: 'Bfrtip',
        buttons: [
            'copy', 'csv',{
                text: 'JSON',
                action: function ( e, dt, button, config ) {
                    var data = dt.buttons.exportData();
 
                    $.fn.dataTable.fileSave(
                        new Blob( [ JSON.stringify( data ) ] ),
                        'Export.json'
                    );
                }
            }
        ]
    } );
</script>
</body>
</html>



