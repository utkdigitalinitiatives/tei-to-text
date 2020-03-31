## tei-to-text ##

This stylesheet aims to extract `text()` from the bodies of TEI in a
semi-coherent fashion.

Given input like:

```xml
    <pb ref="a1"><p>things in an example<del>s</del> to <date>2020-03-30</date>
    some other stuff.</p><p>the idea being that we're going to provide a simple 
    text document.<pb ref="a2"/></p><p>here's some text on the second page.</p>
```

Return output like:

```text
    Page a1
     
    things in an examples to 2020-03-30 some other stuff. the idea being that
    we're going to provide a simple text document.
        
    Page a2
    
    here's some text on the second page.
```

### Things This Doesn't Do: ###
1. line-wrap
2. validation (if you're wanting to validate, make sure you have
   DTDs/Schema on hand)
3. ...?

