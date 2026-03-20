# Architecture Diagram

This diagram represents the high-level architecture of the Apache Struts 2 multi-module web application, covering its MVC layers, key frameworks, data storage, and optional integrations.

## Application Architecture

```mermaid
flowchart TD
    Client["Browser / Client\nHTTP Requests"]

    subgraph WebContainer["Jakarta EE Web Container (Tomcat / Jetty)"]
        Filter["StrutsPrepareAndExecuteFilter\nApache Struts 2 v7.0.3"]

        subgraph Presentation["Presentation Layer"]
            JSP["JSP Views\nStruts 2 UI Tags / JSTL"]
            Tiles["Apache Tiles 3\nComposite Layouts"]
            Sitemesh["SiteMesh 3\nPage Decoration"]
            AngularJS["AngularJS\nSPA Frontend"]
        end

        subgraph Controller["Controller Layer"]
            Actions["Struts 2 Action Classes\nextends ActionSupport / Preparable"]
            Interceptors["Interceptor Stack\nValidation / Exception / Params / i18n"]
        end

        subgraph Business["Business Logic Layer"]
            Services["Service Interfaces\nDefaultPersonService / etc."]
        end

        subgraph DAO["Data Access Layer"]
            DAOLayer["DAO Interfaces\nMemoryPersonDao / etc."]
        end

        subgraph Storage["Data Storage"]
            Memory["In-Memory Store\nHashMap-based POJOs"]
        end

        subgraph CrossCutting["Cross-Cutting Concerns"]
            Logging["Log4j 2 v2.25.1"]
            Validation["Jakarta Validation\nHibernate Validator v8"]
            Security["Apache Shiro v2.0.5\nOptional Security"]
            Jackson["Jackson v2.14.1\nJSON / XML Serialization"]
        end
    end

    subgraph OptionalIntegrations["Optional Integrations"]
        Spring["Spring Framework v6.2\nIoC / DI via struts2-spring-plugin"]
        REST["REST Plugin\nRESTful API endpoints"]
        JasperReports["JasperReports v6.21\nPDF / Excel Report Generation"]
        JFreeChart["JFreeChart\nChart Generation"]
        Quarkus["Quarkus v3.28\nCloud-Native Runtime"]
    end

    Client -->|HTTP| Filter
    Filter --> Actions
    Actions --> Interceptors
    Actions --> Services
    Services --> DAOLayer
    DAOLayer --> Memory
    Actions -->|render| JSP
    Actions -->|render| Tiles
    Actions -->|render| Sitemesh
    Actions -->|JSON response| AngularJS
    Actions -.->|optional| Spring
    Actions -.->|optional| REST
    Actions -.->|optional| JasperReports
    Actions -.->|optional| JFreeChart
    Actions -.->|optional| Quarkus
    Interceptors --- Validation
    Interceptors --- Logging
    Actions --- Security
    Actions --- Jackson
```
