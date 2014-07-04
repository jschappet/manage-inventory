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
        
        <label for="email">Email Address</label>
        <form:input path="email"   type="email" />
        <br/>
        
        
        <label for="consent">Consent</label>
        <form:input path="consent"  />
        <br/>
        
        <label for="deleted">Deleted</label>
        <form:input path="deleted"  />
        <br/>
        
        <form:hidden path="languageId"  value="1" />
        
        <label for="password">Password</label>
        <form:password path="password"  />
        <br/>
        
        <input type="submit" value="Save" class="btn btn-primary" />
        <a class="btn" href="list.html">Cancel</a>
    </fieldset>
</form:form>