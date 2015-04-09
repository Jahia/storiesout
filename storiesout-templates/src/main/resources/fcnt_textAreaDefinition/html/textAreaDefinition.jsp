<!-- Textarea -->
<div class="control-group">
    <label class="control-label" for="<@= id @>">
        <@= label @>
    </label>

    <div class="controls">
        <textarea id="<@= id @>" name="<@= id @>" <@ if(validations != undefined && validations.required) { @> required="required" <@ } @> class="form-control" placeholder="<@= textarea @>"></textarea>
        <@ if(validations != undefined) { @>
            <span class="hide help-inline control-label"></span>
        <@ } @>
        <@ if (helptext.length > 0) { @>
            <p class="help-block"><@= helptext @></p>
        <@ } @>
    </div>
</div>
