<div class="inner-container">

    <g:form id="userProfile" controller="user" action="updateUserProfile" enctype="multipart/form-data">
        <fieldset>
            <div class="line">
                <label for="firstName">First Name: </label>
                <input name="firstName" id="firstName" required novalidate="novalidate"/>

            </div>
            <div class="line">
                <label for="lastName">Last Name: </label>
                <input name="lastName" id="lastName" required novalidate="novalidate"/>

            </div>
             <div class="line">
                 <label for="userName"> Username*: </label>
                 <input type="text" name="userName" id="userName" required novalidate="novalidate"/>
             </div>
                <div class="line"><label for="image">Photo</label>
                <input type="file" id="image" name="image" required novalidate="novalidate">
            </div>
            <div class="line">
                <g:submitButton name="submitButton" value="Update" />
            </div>
         </fieldset>
    </g:form>
</div>
