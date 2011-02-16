#lang scribble/doc

@(require scribble/manual)

@title{@bold{SXML}: The S-Expression representation of XML terms}

@author[(author+email "John Clements" "clements@racket-lang.org")]

@(require (planet cce/scheme:7:2/require-provide))

@(require (for-label racket
            #;(this-package-in main)))

@defmodule[(planet clements/sxml2)]{This planet library contains Oleg Kiselyov's SXML 
 libraries in a Racket-friendly format.}


@(section "SSAX-code.rkt")
  
@defproc[(ssax:xml->sxml [port port?] [namespace-prefix-assig (listof (cons symbol? string?))]) sxml?]{
 Reads a single xml element from the given @racket[port], and returns the 
 corresponding sxml representation.  The @racket[namespace-prefix-assig]
 association list provides shortened forms to be used in place of 
 namespaces.
 
 So, for instance,
 
 @racketblock[
(ssax:xml->sxml 
 (open-input-string 
  "<zippy><pippy pigtails=\"2\">ab</pippy>cd</zippy>")
 '())]
 
 Evaluates to:
 
 @racketblock['(*TOP* (zippy (pippy (|@| (pigtails "2")) "ab") "cd"))]
 }


  @racketblock[(#%provide
   attlist-fold
   attlist-null?
   attlist-remove-top
   name-compare
   ssax:Prefix-XML
   ssax:S-chars
   ssax:assert-token
   ssax:largest-unres-name
   ssax:skip-pi
   ssax:xml->sxml
   ssax:make-parser
   xml-token-head
   xml-token-kind
   ssax:read-cdata-body
   assq-values
   attlist->alist
   make-empty-attlist
   make-xml-token
   ssax:complete-start-tag
   ssax:handle-parsed-entity
   ssax:read-QName
   ssax:read-attributes
   ssax:read-external-id
   ssax:read-markup-token
   ssax:read-pi-body-as-string
   ssax:skip-S
   ssax:skip-internal-dtd
   ssax:make-parser/positional-args
   ssax:define-labeled-arg-macro
   fold-right
   fold
   string-whitespace?
   attlist-add
   ssax:ncname-starting-char?
   ssax:predefined-parsed-entities
   ssax:read-NCName
   ssax:read-char-data
   ssax:read-char-ref
   run-test
   ssax:resolve-name
   ssax:reverse-collect-str
   ssax:reverse-collect-str-drop-ws
   ssax:scan-Misc
   ssax:uri-string->symbol
   xml-token?
   ssax:make-pi-parser
   ssax:make-elem-parser)]
  
@(section "common.rkt")
@racketblock[(#%provide close-output-string filter and-let*)]
  @(section "myenv.rkt")
  @racketblock[(#%provide
   with-input-from-string
   cerr
   assert
   cond-expand
   inc
   dec
   ++!
   include
   push!
   assq-def
   nl
   declare
   --
   cout
   identify-error
   myenv:error
   env.bind
   whennot
   assv-def
   assoc-def
   assure
   env.find
   env.demand
   cons*
   call-with-input-string
   let-values*
   ++
   --!)]
  @(section "util.rkt")
  @racketblock[(#%provide
   any?
   make-char-quotator
   list-intersperse
   list-tail-diff
   string-rindex
   string-split
   substring?
   string->integer)]
  @(section "parse-error.rkt")
  @racketblock[(#%provide SSAX:warn parser-error ssax:warn)]
  @(section "input-parse.rkt")
  @racketblock[(#%provide
   skip-until
   assert-curr-char
   input-parse:init-buffer
   next-token
   next-token-of
   skip-while
   define-opt
   peek-next-char)]
  @(section "look-for-str.rkt")
  @racketblock[(#%provide MISCIO:find-string-from-port? find-string-from-port?)]
  @(section "char-encoding.rkt")
  @racketblock[(#%provide
   char-newline
   char-return
   char-space
   ucscode->char
   ascii->char
   char-tab)]
  @(section "SXML-tree-trans.rkt")
  @racketblock[(#%provide SRV:send-reply replace-range foldts post-order pre-post-order)]
  @(section "sxpathlib.rkt")
  @racketblock[(#%provide
   node-or
   node-equal?
   node-join
   sxml:child-elements
   select-kids
   sxml:child-nodes
   sxml:node?
   node-parent
   node-trace
   ntype??
   sxml:child
   node-reverse
   ntype-names??
   sxml:attribute
   take-after
   node-self
   take-until
   as-nodeset
   sxml:complement
   sxml:filter
   nodeset?
   node-closure
   node-pos
   node-reduce
   sxml:parent
   node-eq?
   ntype-namespace-id??
   map-union
   sxml:element?
   sxml:attr-list)]
  @(section "srfi-12.rkt")
  @racketblock[(#%provide
   signal
   condition-property-accessor
   exc:signal
   exn:exception->condition
   make-composite-condition
   make-property-condition
   handle-exceptions
   condition?
   abort
   condition-predicate
   with-exception-handler)]
  @(section "mime.rkt")
  @racketblock[(#%provide MIME:parse-content-type MIME:read-headers http-token-char?)]
  @(section "http.rkt")
  @racketblock[(#%provide
   flush-output-port
   http-transaction
   open-tcp-connection
   shutdown-sender
   define-def)]
  @(section "access-remote.rkt")
  @racketblock[(#%provide
   ar:components->uri
   ar:file-extension
   ar:normalize-dir-lst
   open-input-resource
   ar:path->segments
   ar:resolve-uri-according-base
   ar:resource-type
   ar:segments->path
   ar:uri->components
   resource-exists?)]
  @(section "id.rkt")
  @racketblock[(#%provide
   id:read-document-declaration
   SXML->SXML+id
   id:AttType-ID?
   id:doctype-handler
   id:ending-action
   id:finish-element-handler
   id:ignore-PI
   id:ignore-comment
   id:ignore-until
   id:make-seed
   id:new-level-seed-handler
   id:process-AttlistDecl
   id:process-DefaultDecl
   id:process-ExternalID
   id:process-doctypedecl
   id:process-literal
   id:process-markupdecl*
   id:process-s
   id:read-external-dtd
   id:read-n
   id:read-name
   id:seed-attrs
   id:seed-index
   id:to-small
   id:unite-id-attrs
   id:process-AttDef
   id:process-prolog)]
  @(section "xlink-parser.rkt")
  @racketblock[(#%provide
   xlink:add-default-arc
   xlink:append-branch
   xlink:check-type-show-actuate-constraints
   xlink:construct-xlink-values
   xlink:ending-action
   xlink:finish-element-handler
   xlink:get-port-position
   xlink:make-arc-info
   xlink:make-full-seed
   xlink:namespace-uri
   xlink:new-level-seed-handler
   xlink:read-SXML-attributes
   SXML->SXML+xlink
   SHTML->SHTML+xlink
   xlink:add-arc
   xlink:add-declared-label
   xlink:add-extended
   xlink:add-locator
   xlink:add-resource
   xlink:add-simple
   xlink:all-labels-declared
   xlink:arc-info-data
   xlink:arc-info-from
   xlink:arc-info-linkbase
   xlink:arc-info-position
   xlink:arc-info-to
   xlink:arc-start
   xlink:branch-helper
   xlink:check-helper
   xlink:extended-end
   xlink:extended-start
   xlink:general-end
   xlink:general-start
   xlink:get-uri
   xlink:linkbase-uri
   xlink:locator-end
   xlink:locator-start
   xlink:read-attributes
   xlink:replace-branch
   xlink:resource-data
   xlink:resource-end
   xlink:resource-label
   xlink:resource-start
   xlink:seed-arcs
   xlink:seed-declared-labels
   xlink:seed-locators+resources
   xlink:seed-mode
   xlink:seed-stack
   xlink:seed-sxlink-arcs
   xlink:seed-sxpointer
   xlink:set-uri-for-sxlink-arcs
   xlink:simple-end
   xlink:simple-start
   xlink:sxpointer->childseq
   xlink:sxpointer4sibling
   xlink:values-actuate
   xlink:values-arcrole
   xlink:values-from
   xlink:values-href
   xlink:values-label
   xlink:values-role
   xlink:values-show
   xlink:values-title
   xlink:values-to
   xlink:values-type
   xlink:arc-end
   xlink:make-locator-or-resource
   xlink:make-small-seed
   xlink:none-end
   xlink:none-start
   xlink:parser-error)]
  @(section "ssax-prim.rkt")
  @racketblock[(#%provide reverse-collect-str-drop-ws RES-NAME->SXML reverse-collect-str)]
  @(section "multi-parser.rkt")
  @racketblock[(#%provide
   bad-accessor
   get-sxml-seed
   make-seed
   parent:construct-element
   parent:new-level-seed-handler
   ssax:multi-parser)]

@section{sxml-tools.rkt}

    @racketblock['(#%provide
     sxml:aux-as-list
     sxml:aux-list-node
     sxml:change-attrlist
     sxml:change-name
     sxml:ns-id
     sxml:ns-uri->id
     sxml:shallow-minimized?
     sxml:sxml->xml
     sxml:find-name-separator
     filter-and-map
     sxml:add-aux
     sxml:name
     sxml:node-name
     sxml:node-parent
     sxml:non-terminated-html-tag?
     sxml:ns-list
     sxml:ns-prefix
     sxml:string->xml
     sxml:text
     check-list
     select-first-kid
     sxml:add-attr
     sxml:attr
     sxml:attr->html
     sxml:attr-as-list
     sxml:attr-from-list
     sxml:attr-list-node
     sxml:attr-list-u
     sxml:attr-u
     sxml:aux-list
     sxml:aux-list-u
     sxml:aux-node
     sxml:change-attr
     sxml:change-content
     sxml:content-raw
     sxml:error
     sxml:lookup
     sxml:minimized?
     sxml:name->ns-id
     sxml:normalized?
     sxml:ns-id->nodes
     sxml:ns-id->uri
     sxml:ns-uri
     sxml:num-attr
     sxml:set-attr
     sxml:shallow-normalized?
     sxml:string->html
     sxml:sxml->html
     sxml:element-name
     sxml:empty-element?
     sxml:attr->xml
     sxml:aux-nodes
     sxml:clean
     sxml:content
     sxml:ncname
     sxml:ns-uri->nodes
     sxml:squeeze)]

    
    @section{sxpath-ext.rkt}
    
    @racketblock['(#%provide
     sxml:merge-sort
     sxml:nested-loop-join
     sxml:not-equal?
     sxml:number
     sxml:preceding
     sxml:string
     sxml:add-string-to-tree
     sxml:boolean
     sxml:id
     sxml:list-head
     sxml:charlst->branch
     sxml:descendant
     sxml:descendant-or-self
     sxml:equality-cmp
     sxml:merge-sort-join
     sxml:namespace
     sxml:preceding-sibling
     sxml:radix-sort-join
     sxml:ancestor
     sxml:ancestor-or-self
     sxml:equal?
     sxml:following
     sxml:following-sibling
     sxml:relational-cmp
     sxml:string->tree
     sxml:string-in-tree?
     sxml:string-value)]
    
    
    @section{xpath-parser.rkt}
    
    @racketblock['(#%provide
     sxml:parse-check-sequence
     sxml:assert-end-of-path
     sxml:parse-name
     sxml:skip-ws
     txp:semantic-errs-detected?
     txp:signal-semantic-error
     sxml:whitespace
     txp:error?
     sxml:delimiter
     sxml:non-first?
     sxml:parse-assert
     sxml:parse-check
     sxml:parse-literal
     sxml:parse-natural
     sxml:parse-ncname
     sxml:parse-number
     sxml:parse-qname
     sxml:xpointer-parse-error
     sxml:xpointer-parse-warning
     txp:param-value
     txp:parameterize-parser
     txp:resolve-ns-prefix)]
    
    
    @(section "txpath.rkt")
    
    @racketblock['(#%provide
     sxml:xpointer+index
     sxml:classic-res
     sxml:core-boolean
     txpath
     sxml:api-helper
     sxml:api-helper0
     sxml:api-index-helper
     sxml:arithmetic-eval
     sxml:classic-params
     sxml:core-ceiling
     sxml:core-concat
     sxml:core-contains
     sxml:core-count
     sxml:core-false
     sxml:core-floor
     sxml:core-id
     sxml:core-lang
     sxml:core-last
     sxml:core-local-name
     sxml:core-name
     sxml:core-namespace-uri
     sxml:core-normalize-space
     sxml:core-not
     sxml:core-number
     sxml:core-position
     sxml:core-round
     sxml:core-starts-with
     sxml:core-string
     sxml:core-string-length
     sxml:core-substring
     sxml:core-substring-after
     sxml:core-substring-before
     sxml:core-sum
     sxml:core-translate
     sxml:core-true
     sxml:xpath
     sxml:xpath+index
     sxml:xpath+root
     sxml:xpath+root+vars
     sxml:xpath-expr
     sxml:xpath-nodeset-filter
     sxml:xpointer
     sxml:xpointer+root+vars
     sxml:xpointer-runtime-error)]
    
    
    
    @(section "sxpath.rkt")
    @racketblock['(#%provide sxml:id-alist sxpath car-sxpath if-car-sxpath if-sxpath)]
    
    
    @(section "xpath-ast.rkt")
    @racketblock['(#%provide
     txp:ast-params
     txp:ast-api-helper
     txp:ast-operation-helper
     txp:ast-res
     txp:construct-step
     txp:expr->ast
     txp:step-axis
     txp:step-node-test
     txp:step-preds
     txp:step?
     txp:sxpath->ast
     txp:xpath->ast
     txp:xpointer->ast)]
    
    
    @(section "xpath-context_xlink.rkt")
    @racketblock['(#%provide
     draft:ast-function-call
     draft:ast-literal
     draft:ast-node-test
     xlink:get-docs-with-respect-to-loaded
     draft:core-round
     draft:core-substring-after
     xlink:elem-title?
     xlink:get-document-by-uri
     xlink:get-documents-with-params
     draft:ancestor-or-self
     draft:ast-and-expr
     draft:ast-axis-specifier
     draft:ast-equality-expr
     draft:ast-expr
     draft:ast-filter-expr
     draft:core-concat
     draft:core-contains
     draft:core-count
     draft:core-false
     draft:core-floor
     draft:core-id
     draft:reach-root
     draft:smart-make-context
     draft:xpath
     xlink:embed-arcs-into-document
     draft:core-lang
     draft:core-last
     draft:core-local-name
     draft:core-name
     draft:core-namespace-uri
     draft:core-normalize-space
     draft:core-not
     draft:core-number
     draft:core-position
     draft:core-starts-with
     draft:core-string
     draft:na-max
     draft:top?
     sxpath-with-context
     sxpath/c
     xlink:elem-extended?
     xlink:elem-locator?
     xlink:elem-resource?
     xlink:elem-simple?
     xlink:find-doc
     xlink:id-index
     xlink:load-linked-docs-with-params
     xlink:parameterized-load-with-respect-documents
     xlink:parser
     xlink:referenced-linkbase-uris
     draft:ancestor
     draft:api-helper
     draft:arglist->ns+na
     draft:ast-absolute-location-path
     draft:ast-additive-expr
     draft:ast-child-seq
     draft:ast-full-xptr
     draft:ast-function-arguments
     draft:ast-location-path
     draft:ast-multiplicative-expr
     draft:ast-number-list
     draft:ast-or-expr
     draft:ast-path-expr
     draft:ast-predicate
     draft:ast-predicate-list
     draft:ast-relational-expr
     draft:ast-relative-location-path
     draft:ast-step
     draft:ast-step-list
     draft:ast-union-expr
     draft:ast-variable-reference
     draft:ast-xpointer
     draft:attribute
     draft:child
     draft:contextset->nodeset
     draft:core-boolean
     draft:core-ceiling
     draft:core-string-length
     draft:core-substring
     draft:core-substring-before
     draft:core-sum
     draft:core-translate
     draft:core-true
     draft:descendant
     draft:descendant-or-self
     draft:find-proper-context
     draft:following
     draft:following-sibling
     draft:list-head
     draft:list-last
     draft:make-context
     draft:make-list
     draft:na+
     draft:na-min
     draft:na-minus
     draft:na-minus-nneg
     draft:na>
     draft:na>=
     draft:namespace
     draft:parent
     draft:preceding
     draft:preceding-sibling
     draft:recover-contextset
     draft:remove-eq-duplicates
     draft:self
     draft:siblings->context-set
     draft:signal-semantic-error
     draft:sxpath
     draft:xpath-expr
     draft:xpointer
     sxml:context->ancestors
     sxml:context->ancestors-u
     sxml:context->content
     sxml:context->content-u
     sxml:context->node
     sxml:context->node-u
     sxml:context-u?
     sxml:context?
     sxml:document
     txpath-with-context
     txpath/c
     xlink:add-docs-to-vars
     xlink:add-documents-helper
     xlink:add-documents-recursively
     xlink:add-linkbases-recursively
     xlink:api-error
     xlink:arc?
     xlink:arcs-declared-here
     xlink:arcs-embedded
     xlink:arcs-embedded?
     xlink:arcs-linkbase-uris
     xlink:arcs-outgoing
     xlink:arcs-uris
     xlink:axis-arc
     xlink:axis-traverse
     xlink:axis-traverse-arc
     xlink:docs-exchange-arcs
     xlink:docs-variable
     xlink:documents
     xlink:documents-embed
     xlink:elem-arc?
     xlink:get-documents+linkbases
     xlink:node-arcs
     xlink:node-arcs-on-top
     xlink:node-embedded-arcs
     xlink:ntype??
     xlink:referenced-uris
     xlink:remove-equal-duplicates
     xlink:set-uri
     xlink:traverse-arcs
     xlink:unite-duplicate-keys-in-alist
     xlink:uris
     draft:ast-number)]
    
    
    @(section "ddo-axes.rkt")
    @racketblock['(#%provide
     ddo:following-single-level
     ddo:list-last
     ddo:namespace
     ddo:parent
     ddo:parent-pos
     ddo:parent-single-level-pos
     ddo:parent-single-level
     ddo:descendant-pos
     ddo:discard-attributes
     ddo:following
     ddo:preceding-single-level
     ddo:preceding-single-level-pos
     ddo:following-sibling-single-level-pos
     ddo:following-single-level-pos
     ddo:ancestor
     ddo:ancestor-or-self-pos
     ddo:attribute
     ddo:self
     ddo:ancestor-or-self
     ddo:ancestor-pos
     ddo:attr-child
     ddo:attrs-and-values
     ddo:child
     ddo:child-pos
     ddo:descendant
     ddo:descendant-or-self
     ddo:descendant-or-self-pos
     ddo:following-sibling
     ddo:following-sibling-pos
     ddo:following-sibling-single-level
     ddo:preceding
     ddo:preceding-sibling
     ddo:preceding-sibling-pos
     ddo:preceding-sibling-single-level
     ddo:preceding-sibling-single-level-pos)]
    
    @(section "ddo-txpath.rkt")
    @racketblock['(#%provide
     ddo:ast-path-expr
     ddo:type-string
     ddo:ast-predicate
     ddo:ast-predicate-list
     ddo:ast-relational-expr
     ddo:construct-pred-values-pos
     ddo:location-step-pos
     ddo:nset-contained?
     ddo:nset-equal?
     ddo:or
     ddo:pos-result-forward?
     ddo:rewrite-step*
     ddo:sxpath
     ddo:txpath
     ddo:type-any
     ddo:ast-function-call
     ddo:ast-literal
     ddo:ast-multiplicative-expr
     ddo:ast-step-list
     ddo:charlst->branch
     ddo:construct-pred-values
     ddo:foldr
     ddo:generate-pred-id
     ddo:get-var-value-from-tree
     ddo:list-head
     ddo:list-ref
     ddo:list-tail
     ddo:location-step-non-intersect
     ddo:ast-location-path
     ddo:check-special-predicate
     ddo:check4ast-number
     ddo:filter-expr-special-predicate
     ddo:get-abs-lpath-value
     ddo:type-number
     ddo:add-var-to-tree
     ddo:add-vector-to-var-binding
     ddo:all-contexts-in-doc
     ddo:api-helper
     ddo:apply-ast-procedure
     ddo:ast-absolute-location-path
     ddo:ast-additive-expr
     ddo:ast-and-expr
     ddo:ast-axis-specifier
     ddo:ast-equality-expr
     ddo:ast-expr
     ddo:ast-filter-expr
     ddo:ast-function-arguments
     ddo:ast-number
     ddo:ast-or-expr
     ddo:ast-relative-location-path
     ddo:ast-step
     ddo:ast-union-expr
     ddo:ast-variable-reference
     ddo:check-ast-desc-os?
     ddo:check-ast-position?
     ddo:filter-expr-general
     ddo:filter-expr-non-pos
     ddo:get-pred-value
     ddo:get-pred-value-pos
     ddo:location-step-non-pos
     ddo:pos-result->nodeset
     ddo:type-boolean
     ddo:type-nodeset
     ddo:unite-2-contextsets
     ddo:unite-multiple-context-sets
     ddo:var-binding->tree
     ddo:vector-copy-set
     ddo:xpath-expr)]
    
    
    @(section "lazy-xpath.rkt")
    @racketblock['(#%provide
     lazy:ast-variable-reference
     lazy:result->list
     lazy:ast-absolute-location-path
     lazy:ast-axis-specifier
     lazy:core-normalize-space
     lazy:core-name
     lazy:core-namespace-uri
     lazy:core-not
     lazy:ancestor
     lazy:ancestor-or-self
     lazy:api-helper
     lazy:ast-additive-expr
     lazy:ast-and-expr
     lazy:ast-equality-expr
     lazy:ast-expr
     lazy:ast-filter-expr
     lazy:ast-function-arguments
     lazy:ast-function-call
     lazy:ast-literal
     lazy:ast-location-path
     lazy:ast-multiplicative-expr
     lazy:ast-number
     lazy:ast-or-expr
     lazy:ast-path-expr
     lazy:ast-predicate
     lazy:ast-predicate-list
     lazy:ast-relational-expr
     lazy:ast-relative-location-path
     lazy:ast-step
     lazy:ast-step-list
     lazy:ast-union-expr
     lazy:attribute
     lazy:axis-consume-nodeset
     lazy:boolean
     lazy:car
     lazy:cdr
     lazy:child
     lazy:contextset->nodeset
     lazy:core-boolean
     lazy:core-ceiling
     lazy:core-concat
     lazy:core-contains
     lazy:core-count
     lazy:core-false
     lazy:core-floor
     lazy:core-id
     lazy:core-lang
     lazy:core-last
     lazy:core-local-name
     lazy:core-number
     lazy:core-position
     lazy:core-round
     lazy:core-starts-with
     lazy:core-string
     lazy:core-string-length
     lazy:core-substring
     lazy:core-substring-after
     lazy:core-substring-before
     lazy:core-sum
     lazy:core-translate
     lazy:core-true
     lazy:descendant
     lazy:descendant-or-self
     lazy:equal?
     lazy:equality-cmp
     lazy:filter
     lazy:find-foll-siblings
     lazy:find-prec-siblings
     lazy:find-proper-context
     lazy:following
     lazy:following-sibling
     lazy:length
     lazy:map
     lazy:namespace
     lazy:node->sxml
     lazy:not-equal?
     lazy:null?
     lazy:number
     lazy:or
     lazy:output-siblings
     lazy:parent
     lazy:preceding
     lazy:preceding-sibling
     lazy:promise?
     lazy:reach-root
     lazy:recover-contextset
     lazy:relational-cmp
     lazy:self
     lazy:string
     lazy:string-value
     lazy:sxpath
     lazy:txpath
     lazy:xpath-expr)]
    
    @(section "lazy-ssax.rkt")
    @racketblock['(#%provide
     lazy:except-last
     lazy:force-descendants
     lazy:replace-common
     lazy:seed-common
     lazy:xml->sxml)]
    
    
    @(section "modif.rkt")
    @racketblock['(#%provide
     modif:delete
     modif:delete-undeep
     modif:insert-following
     modif:insert-into
     modif:insert-preceding
     modif:rename
     sxml:assert-proper-attribute
     sxml:clone
     sxml:clone-nset-except
     sxml:lambdas-upd-specifiers->targets
     sxml:modification-error
     sxml:modify
     sxml:separate-list
     sxml:transform-document
     sxml:tree-trans
     sxml:unite-annot-attributes-lists
     sxml:update-specifiers->lambdas)]
    
    
    @(section "serializer.rkt")
    @racketblock['(#%provide
     srl:name->qname-components
     srl:display-fragments-2nesting
     srl:processing-instruction->str-lst
     srl:namespace-assoc-for-elem
     srl:qname->string
     srl:select-kids
     srl:separate-list
     srl:apply-string-append
     srl:assoc-cdr-string=
     srl:atomic->string
     srl:attribute->str-lst
     srl:char-nl
     srl:clean-fragments
     srl:comment->str-lst
     srl:construct-start-end-tags
     srl:conventional-ns-prefixes
     srl:display-node-out-recursive
     srl:display-sxml
     srl:display-top-out
     srl:empty-elem?
     srl:escape-alist-att-value
     srl:escape-alist-char-data
     srl:escape-alist-html-att
     srl:extract-original-prefix-binding
     srl:make-xml-decl
     srl:map-append
     srl:mem-pred
     srl:member-ci
     srl:namespace-decl->str-lst
     srl:newline
     srl:node->nested-str-lst-recursive
     srl:normalize-sequence
     srl:ns-assoc-for-top
     srl:parameterizable
     srl:shtml-entity->char-data
     srl:split-name
     srl:string->att-value
     srl:string->cdata-section
     srl:string->char-data
     srl:string->escaped
     srl:string->html-att
     srl:sxml->html
     srl:sxml->html-noindent
     srl:sxml->string
     srl:sxml->xml
     srl:sxml->xml-noindent
     srl:top->nested-str-lst
     srl:update-space-specifier
     srl:xml-char-escaped)]
     



@section{Reporting Bugs}

For Heaven's sake, report lots of bugs!