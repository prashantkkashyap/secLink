    <div class="inner-container">
        %{--<g:hasErrors bean="${user}">
            <div>
                <g:renderErrors bean="${user}" as="list"/>
            </div>
        </g:hasErrors>--}%
        <g:form id="userPasswd" controller="user" action="updateUserPassword">
            <fieldset>
                <div class="line">
                    <label for="password">Password*: </label>
                    <g:passwordField name="password" id="password" required="required" novalidate="novalidate"/>

                </div>
                <div class="line">
                    <label for="confirm">Confirm Password*: </label>
                    <g:passwordField name="confirm" id="confirm" required="required" novalidate="novalidate"/>

                </div>
                <div class="line">
                    <g:submitButton name="submitButton" value="Update" />
                </div>
            </fieldset>
        </g:form>
    </div>