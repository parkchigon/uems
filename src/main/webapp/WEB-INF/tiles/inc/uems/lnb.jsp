<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/include/import.jsp" %>
<%@ include file="/WEB-INF/views/common/include/taglib.jsp" %>
<%@ taglib prefix="nowMenu" uri="/WEB-INF/tld/menu-tld.tld" %>
<!-- s: left content -->
<a href="#" class="btn_lnb"><i class="fa arrow"></i></a>
<div class="left_content">
	<div id="lnb" class="lnb_wrap">
		<h2 class="tit">${nowMenu:getSubMenuInfo()[0]}</h2>
		<ul>
			<c:forEach var="result" items="${nowMenu:getSubMenuInfo()}" varStatus="status">
				<c:if test="${status.index > 0}">
					<c:choose>
						<c:when test="${!empty result.menu2List}">
							<li class="${result.menuOn}">
								<a href="#none">${result.menuName}<i class="fa arrow"></i></a>
								<ul style="${result.menu2Style}">
									<c:forEach var="result2" items="${result.menu2List}" varStatus="status">
										<li>
											<a href='${result2.menu2Url}'>${result2.menu2Name}</a>
										</li>
									</c:forEach>
								</ul>
							</li>
						</c:when>
						<c:otherwise>
							<li class="noDepth">
								<a href="${result.menuUrl}">${result.menuName}</a>
							</li>
						</c:otherwise>
					</c:choose>
				</c:if>
			</c:forEach>
		</ul>
	</div>
</div>
<!-- e: left content -->

