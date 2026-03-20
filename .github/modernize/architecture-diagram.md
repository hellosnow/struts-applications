# Architecture Diagram

This Apache Struts 2 multi-module Maven project is a collection of 44 web application examples, each packaged as a WAR and deployed on a Jakarta EE 10 Servlet container.

## Application Architecture

```mermaid
flowchart TB
    subgraph Client["Client Layer"]
        Browser["Web Browser\nJSP / HTML Pages"]
        Angular["AngularJS SPA\nrest-angular module"]
    end

    subgraph Presentation["Presentation Layer"]
        StrutsFilter["Apache Struts 2 Core v7.0.3\nDispatcher Filter"]
        subgraph Views["View Technologies"]
            JSP["JSP with Struts Tags"]
            Tiles["Apache Tiles 2\nTemplate Composition"]
            Freemarker["Freemarker\nQuarkus Module"]
        end
        subgraph Results["Result Types"]
            JSON["JSON Result\nJackson 2.14.1"]
            Reports["JasperReports 6.21.4\nPDF / Excel / HTML"]
            Charts["JFreeChart 1.5.6\nChart Generation"]
        end
    end

    subgraph Business["Business Logic Layer"]
        subgraph Actions["Action Classes"]
            CRUD["CRUD Actions\nPersonAction, EditAction"]
            REST["REST Controllers\nOrderController via REST Plugin"]
            Auth["Auth Actions\nLoginAction, LogoutAction"]
        end
        subgraph Cross["Cross-Cutting Concerns"]
            Shiro["Apache Shiro 2.0.5\nAuthentication and Authorization"]
            Validation["Jakarta Bean Validation 3.0\nHibernate Validator 8.0.1"]
            Spring["Spring Framework 6.2.12\nDependency Injection"]
            Interceptors["Custom Interceptors\nSecurity, Exception, Validation"]
        end
    end

    subgraph Data["Data Layer"]
        MemDAO["In-Memory DAO\nMemoryPersonDao\nArrayList backed"]
        XMLDB["XML-Based Store\nMemoryUserDatabase\nCommons Digester 3"]
        OrderSvc["In-Memory Service\nOrdersService\nCollection backed"]
    end

    subgraph Infrastructure["Infrastructure"]
        Jetty["Eclipse Jetty 11.0.18\nServlet Container\nLocal Dev Server"]
        Log4j2["Apache Log4j2 2.25.1\nLogging"]
        Maven["Maven Multi-Module Build\nJava 17\n44 WAR Modules"]
    end

    Browser -- "HTTP Request" --> StrutsFilter
    Angular -- "REST JSON/XML" --> StrutsFilter
    StrutsFilter -- "Dispatches to" --> Actions
    StrutsFilter -- "Applies" --> Interceptors
    Interceptors -- "Delegates to" --> Shiro
    Interceptors -- "Delegates to" --> Validation
    Actions -- "Spring DI" --> Spring
    Actions -- "Renders" --> Views
    Actions -- "Renders" --> Results
    CRUD -- "Read/Write" --> MemDAO
    CRUD -- "Read/Write" --> XMLDB
    REST -- "Read/Write" --> OrderSvc
    Auth -- "Authenticate" --> Shiro
    StrutsFilter -- "Runs on" --> Jetty
    Jetty -- "Logs via" --> Log4j2
    Maven -- "Packages" --> Jetty
```
