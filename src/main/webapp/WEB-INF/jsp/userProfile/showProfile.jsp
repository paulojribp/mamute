<section class="basic-user-data">
	<div class="subheader">
		<tags:userProfileLink user="${selectedUser}" htmlClass="title page-title" />
		<c:if test="${isCurrentUser}">
			<ul class="subheader-menu">
				<li><a href="${linkTo[UserProfileController].editProfile[selectedUser.id]}"><fmt:message key="user_profile.edit" /></a></li>
			</ul>
		</c:if>
	</div>
		
	<div class="image-and-information">
		<img class="profile-image" src="${selectedUser.photo}?s=128"/>
		<span class="karma">${selectedUser.karma}</span>
		<span><fmt:message key="user_profile.reputation"/></span>
	</div>
	
	<ul class="data-list">
		<li class="data-line">
			<h5 class="data-section-title ellipsis"><fmt:message key="user_profile.bio" /></h5>
			<dl class="data-section">
				<dt class="data-title ellipsis"><fmt:message key="user_profile.website"/></dt>
				<dd class="data-description ellipsis">${selectedUser.website}</dd>
				<dt class="data-title ellipsis"><fmt:message key="user_profile.location"/></dt>
				<dd class="data-description ellipsis">${selectedUser.location}</dd>
				<c:if test="${isCurrentUser}">
					<dt class="data-title ellipsis"><fmt:message key="user_profile.email"/></dt>
					<dd class="data-description ellipsis">${selectedUser.email}</dd>
					<dt class="data-title ellipsis"><fmt:message key="user_profile.name"/></dt>
					<dd class="data-description ellipsis">${selectedUser.name}</dd>
				</c:if>
				<dt class="data-title ellipsis"><fmt:message key="user_profile.age"/></dt>
				<dd class="data-description ellipsis">${selectedUser.age}</dd>
			</dl>
		</li>
		<li class="data-line">
			<h5 class="data-section-title ellipsis"><fmt:message key="user_profile.stats" /></h5>
			<dl class="data-section">
				<dt class="data-title ellipsis"><fmt:message key="user_profile.created_at"/></dt>
				<dd class="data-description ellipsis"><tags:prettyTime time="${selectedUser.createdAt}"/></dd>
			</dl>
		</li>
	</ul>
	
	<div class="about-me">
		<c:if test="${isCurrentUser && empty selectedUser.markedAbout}">
			<fmt:message key="user_profile.blank_about_me"/>
			<a href="${linkTo[UserProfileController].editProfile[selectedUser.id]}"><fmt:message key="user_profile.blank_about_me.click"/></a>
		</c:if>
		${selectedUser.markedAbout}
	</div>
</section>
<section class="advanced-user-data">
	<section class="user-questions advanced-data-section">
		<div class="subheader">
			<h3 class="title section-title"><tags:pluralize key="user_profile.questions" count="${fn:length(questionByVotes)}" /></h3>
			<ul class="subheader-menu nav">
				<li class="nav-item"><a class="order-by selected" data-type="questions" data-target-id="user-questions" href="${linkTo[UserProfileController].questionsByVotesWith[selectedUser]}"><fmt:message key="user_profile.order.votes"/></a></li>
				<li class="nav-item"><a class="order-by" data-type="questions" data-target-id="user-questions" href="${linkTo[UserProfileController].questionsByDateWith[selectedUser]}"><fmt:message key="user_profile.order.date"/></a></li>
			</ul>
		</div>
		<ul id="user-questions">
			<c:forEach var="question" items="${questionsByVotes}">
				<li><span>${question.voteCount}</span> <tags:questionLinkFor question="${question}"/></li>
			</c:forEach>
		</ul>
	</section>	
	<section class="user-answers advanced-data-section">
		<div class="subheader">
			<h3 class="title section-title"><tags:pluralize key="user_profile.answers" count="${fn:length(answersByVotes)}" /></h3>
			<ul class="subheader-menu nav">
				<li class="nav-item"><a class="order-by selected" data-type="answers" data-target-id="user-answers" href="${linkTo[UserProfileController].answersByVotesWith[selectedUser]}"><fmt:message key="user_profile.order.votes"/></a></li>
				<li class="nav-item"><a class="order-by" data-type="answers" data-target-id="user-answers" href="${linkTo[UserProfileController].answersByDateWith[selectedUser]}"><fmt:message key="user_profile.order.date"/></a></li>
			</ul>
		</div>
		<ul id="user-answers">
			<c:forEach var="answer" items="${answersByVotes}">
				<li><span>${answer.voteCount}</span> <tags:questionLinkFor answer="${answer}" question="${answer.question}"/></li>
			</c:forEach>
		</ul>
	</section>	
	
</section>
