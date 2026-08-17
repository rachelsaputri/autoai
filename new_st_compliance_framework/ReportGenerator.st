!Object subclass: #ReportGenerator
    instanceVariableNames: ''
    classVariableNames: ''
    poolDictionaries: ''
    category: 'ComplianceFramework'

!ReportGenerator methodsFor: 'api' stamp: 'current'
    generateComplianceReportFor: remediationPlan
        | report content | 
        report := Report new.
        content := StringBuilder new.
        content appendLine: '=== COMPLIANCE VERIFICATION REPORT ==='.
        content appendLine: 'Timestamp: ' , (DateAndTime now printString).
        content appendLine: 'Status: Non-Compliant'.
        content appendLine: 'Findings:'.
        remediationPlan do: [:step |
            content appendLine: '  - ' , step printString
        ].
        content appendLine: '======================================'.
        report setBody: content contents.
        ^ report printString
!

"Helper Classes"

!Object subclass: #Report
    instanceVariableNames: 'body'
    classVariableNames: ''
    poolDictionaries: ''
    category: 'ComplianceFramework'

!Report methodsFor: 'initialization' stamp: 'current'
    initialize
        super initialize.
        body := String new
!

!Report methodsFor: 'accessing' stamp: 'current'
    body
        ^ body
!

!Report methodsFor: 'accessing' stamp: 'current'
    setBody: aString
        body := aString
!

!Report methodsFor: 'printing' stamp: 'current'
    printOn: aStream
        aStream nextPutAll: body
!

!Object subclass: #StringBuilder
    instanceVariableNames: 'buffer'
    classVariableNames: ''
    poolDictionaries: ''
    category: 'ComplianceFramework'

!StringBuilder methodsFor: 'initialization' stamp: 'current'
    initialize
        super initialize.
        buffer := OrderedCollection new
!

!StringBuilder methodsFor: 'api' stamp: 'current'
    appendLine: aString
        buffer add: aString
!

!StringBuilder methodsFor: 'api' stamp: 'current'
    contents
        ^ buffer joinWith: Character crString
!
