// locations to search for config files that get merged into the main config;
// config files can be ConfigSlurper scripts, Java properties files, or classes
// in the classpath in ConfigSlurper format

// grails.config.locations = [ "classpath:${appName}-config.properties",
//                             "classpath:${appName}-config.groovy",
//                             "file:${userHome}/.grails/${appName}-config.properties",
//                             "file:${userHome}/.grails/${appName}-config.groovy"]

// if (System.properties["${appName}.config.location"]) {
//    grails.config.locations << "file:" + System.properties["${appName}.config.location"]
// }

grails.project.groupId = "com.linksharing" // change this to alter the default package name and Maven publishing destination

// The ACCEPT header will not be used for content negotiation for user agents containing the following strings (defaults to the 4 major rendering engines)
grails.mime.disable.accept.header.userAgents = ['Gecko', 'WebKit', 'Presto', 'Trident']
grails.mime.types = [ // the first one is the default format
    all:           '*/*', // 'all' maps to '*' or the first available format in withFormat
    atom:          'application/atom+xml',
    css:           'text/css',
    csv:           'text/csv',
    form:          'application/x-www-form-urlencoded',
    html:          ['text/html','application/xhtml+xml'],
    js:            'text/javascript',
    json:          ['application/json', 'text/json'],
    multipartForm: 'multipart/form-data',
    rss:           'application/rss+xml',
    text:          'text/plain',
    hal:           ['application/hal+json','application/hal+xml'],
    xml:           ['text/xml', 'application/xml']
]

// URL Mapping Cache Max Size, defaults to 5000
//grails.urlmapping.cache.maxsize = 1000

// Legacy setting for codec used to encode data with ${}
grails.views.default.codec = "html"

// The default scope for controllers. May be prototype, session or singleton.
// If unspecified, controllers are prototype scoped.
grails.controllers.defaultScope = 'singleton'

// GSP settings
grails {
    views {
        gsp {
            encoding = 'UTF-8'
            htmlcodec = 'xml' // use xml escaping instead of HTML4 escaping
            codecs {
                expression = 'html' // escapes values inside ${}
                scriptlet = 'html' // escapes output from scriptlets in GSPs
                taglib = 'none' // escapes output from taglibs
                staticparts = 'none' // escapes output from static template parts
            }
        }
        // escapes all not-encoded output at final stage of outputting
        // filteringCodecForContentType.'text/html' = 'html'
    }
}

grails {
    mail {
        host = "smtp.gmail.com"
        port = 465
        username = "stefanmark421@gmail.com"
        password = "Data1234"
        props = ["mail.smtp.auth":"true",
                 "mail.smtp.socketFactory.port":"465",
                 "mail.smtp.socketFactory.class":"javax.net.ssl.SSLSocketFactory",
                 "mail.smtp.socketFactory.fallback":"false"]
    }
}
grails.converters.encoding = "UTF-8"
// scaffolding templates configuration
grails.scaffolding.templates.domainSuffix = 'Instance'

// Set to false to use the new Grails 1.2 JSONBuilder in the render method
grails.json.legacy.builder = false
// enabled native2ascii conversion of i18n properties files
grails.enable.native2ascii = true
// packages to include in Spring bean scanning
grails.spring.bean.packages = []
// whether to disable processing of multi part requests
grails.web.disable.multipart=false

// request parameters to mask when logging exceptions
grails.exceptionresolver.params.exclude = ['password']

// configure auto-caching of queries by default (if false you can cache individual queries with 'cache: true')
grails.hibernate.cache.queries = false

// configure passing transaction's read-only attribute to Hibernate session, queries and criterias
// set "singleSession = false" OSIV mode in hibernate configuration after enabling
grails.hibernate.pass.readonly = false
// configure passing read-only to OSIV session by default, requires "singleSession = false" OSIV mode
grails.hibernate.osiv.readonly = false

environments {
    development {
        grails.logging.jul.usebridge = true
       //grails.serverURL = "http://localhost:8080/linksharing"
        uploadFolder =  "web-app/document/"
    }
    production {
        grails.logging.jul.usebridge = false
        // TODO: grails.serverURL = "http://www.changeme.com"
    }
    qa{
        grails.logging.jul.usebridge = true
        grails.serverURL = "http://prashant.qa6.intelligrape.net"
        uploadFolder ="web-app/document/"
    }
}

// log4j configuration
log4j.main = {
    // Example of changing the log pattern for the default console appender:
    //
    //appenders {
    //    console name:'stdout', layout:pattern(conversionPattern: '%c{2} %m%n')
    //}

    error  'org.codehaus.groovy.grails.web.servlet',        // controllers
           'org.codehaus.groovy.grails.web.pages',          // GSP
           'org.codehaus.groovy.grails.web.sitemesh',       // layouts
           'org.codehaus.groovy.grails.web.mapping.filter', // URL mapping
           'org.codehaus.groovy.grails.web.mapping',        // URL mapping
           'org.codehaus.groovy.grails.commons',            // core / classloading
           'org.codehaus.groovy.grails.plugins',            // plugins
           'org.codehaus.groovy.grails.orm.hibernate',      // hibernate integration
           'org.springframework',
           'org.hibernate',
           'net.sf.ehcache.hibernate'
}

// Added by the JQuery Validation UI plugin:
//jqueryValidationUi {
//	errorClass = 'error'
//	validClass = 'valid'
//	onsubmit = true
//	renderErrorsOnTop = false
//
//	qTip {
//		packed = true
//	  classes = 'ui-tooltip-red ui-tooltip-shadow ui-tooltip-rounded'
//	}
//
//	/*
//	  Grails constraints to JQuery Validation rules mapping for client side validation.
//	  Constraint not found in the ConstraintsMap will trigger remote AJAX validation.
//	*/
//	StringConstraintsMap = [
//		blank:'required', // inverse: blank=false, required=true
//		creditCard:'creditcard',
//		email:'email',
//		inList:'inList',
//		minSize:'minlength',
//		maxSize:'maxlength',
//		size:'rangelength',
//		matches:'matches',
//		notEqual:'notEqual',
//		url:'url',
//		nullable:'required',
//		unique:'unique',
//		validator:'validator'
//	]
//
//	// Long, Integer, Short, Float, Double, BigInteger, BigDecimal
//	NumberConstraintsMap = [
//		min:'min',
//		max:'max',
//		range:'range',
//		notEqual:'notEqual',
//		nullable:'required',
//		inList:'inList',
//		unique:'unique',
//		validator:'validator'
//	]
//
//	CollectionConstraintsMap = [
//		minSize:'minlength',
//		maxSize:'maxlength',
//		size:'rangelength',
//		nullable:'required',
//		validator:'validator'
//	]
//
//	DateConstraintsMap = [
//		min:'minDate',
//		max:'maxDate',
//		range:'rangeDate',
//		notEqual:'notEqual',
//		nullable:'required',
//		inList:'inList',
//		unique:'unique',
//		validator:'validator'
//	]
//
//	ObjectConstraintsMap = [
//		nullable:'required',
//		validator:'validator'
//	]
//
//	CustomConstraintsMap = [
//		phone:'true', // International phone number validation
//		phoneUS:'true',
//		alphanumeric:'true',
//		letterswithbasicpunc:'true',
//    lettersonly:'true'
//	]
//}



// Added by the Spring Security Core plugin:
grails.plugin.springsecurity.userLookup.userDomainClassName = 'com.linksharing.SecUser'
grails.plugin.springsecurity.userLookup.authorityJoinClassName = 'com.linksharing.SecUserSecRole'
grails.plugin.springsecurity.authority.className = 'com.linksharing.SecRole'
grails.plugin.springsecurity.successHandler.defaultTargetUrl='/dashboard/dashboard'
grails.plugin.springsecurity.failurHandler.defaultFailureUrl='/home/home'
grails.plugin.springsecurity.logout.postOnly = false
grails.plugin.springsecurity.rejectIfNoRule = false
grails.plugin.springsecurity.securityConfigType = "Requestmap"
grails.plugin.springsecurity.useSwitchUserFilter=true

grails.plugin.springsecurity.fii.rejectPublicInvocations = false
/*grails.plugin.springsecurity.switchUser.switchUserUrl = '/j_spring_security_switch_user'
grails.plugin.springsecurity.switchUser.exitUserUrl = '/j_spring_security_exit_user'
grails.plugin.springsecurity.switchUser.targetUrl = 'successHandler.defaultTargetUrl'
grails.plugin.springsecurity.switchUser.switchFailureUrl = 'failureHandler.defaultFailureUrl'*/
//grails.plugin.springsecurity.switchUser.usernameParameter= 'SwitchUserFilter.SPRING_SECURITY_SWITCH_USERNAME_KEY'
/*grails.plugin.springsecurity.controllerAnnotations.staticRules=[
        '/j_spring_security_switch_user':['ROLE_SWITCH_USER', 'IS_AUTHENTICATED_FULLY' ],
        '/j_spring_security_exit_user': ['permitAll'],
]*/

grails.plugin.springsecurity.controllerAnnotations.staticRules = [
	'/':                ['permitAll'],
    '/dashboard.gsp':   ['permitAll'],
	'/index':           ['permitAll'],
	'/index.gsp':       ['permitAll'],
	'/assets/**':       ['permitAll'],
	'/**/js/**':        ['permitAll'],
	'/**/css/**':       ['permitAll'],
	'/**/images/**':    ['permitAll'],
	'/**/favicon.ico':  ['permitAll'],
    '/dbconsole/**':    ['permitAll']
]
grails.plugin.springsecurity.interceptUrlMap = [
        // === THIS TWO LINES, for logout and login
        '/logout*' :     ['IS_AUTHENTICATED_ANONYMOUSLY'],
        '/login*' :     ['IS_AUTHENTICATED_ANONYMOUSLY'],
        '/home*':         ['permitALL'],
        '/profile*':       ['permitAll'],
        '*':               ['IS_AUTHENTICATED_ANONYMOUSLY'],
        '/j_spring_security_switch_user': ['ROLE_SWITCH_USER', 'isFullyAuthenticated()']
]




