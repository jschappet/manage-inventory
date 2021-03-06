<%@ include file="/WEB-INF/include.jsp"  %>


<form:form method="post" commandName="person" action="save.html" >
    <fieldset>
        <legend>Person</legend>
        
        <form:hidden path="personId" />
        
        <label for="firstName">FirstName</label>
        <form:input path="firstName"  />
        <br/>
        
        <label for="lastName">LastName</label>
        <form:input path="lastName"  />
        <br/>
        
        <label for="username">Username</label>
        <form:input path="username"  />
        <br/>
        
        <label for="consent">Consent</label>
        <form:input path="consent"  />
        <br/>
        
        <label for="deleted">Deleted</label>
        <form:input path="deleted"  />
        <br/>
        
        <label for="languageId">LanguageId</label>
        <form:input path="languageId"  />
        <br/>
        
        <label for="password">Password</label>
        <form:input path="password"  />
        <br/>
        
        <input type="submit" value="Save" class="btn btn-primary" />
        <a class="btn" href="list.html">Cancel</a>
    </fieldset>
</form:form>