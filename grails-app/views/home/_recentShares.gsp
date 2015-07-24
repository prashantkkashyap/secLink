
<g:each in="${topRecentShares}" var="topRecentShare">
    <div class="inner-container">
        <div style="margin: 1%;">
            <ul>
                <li>${topRecentShare.createdBy.username}   </li>
                <li>${topRecentShare.dateCreated}     </li>
                <li><g:link controller="resource" action="viewPost" id="${topRecentShare.id}">View Post</g:link></li>
            </ul>
            <ul>
                <li>${topRecentShare.description} </li>
            </ul>
        </div>
    </div>
</g:each>
