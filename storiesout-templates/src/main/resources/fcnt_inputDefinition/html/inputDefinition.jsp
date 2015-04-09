<!-- Text input-->
<div class="control-group">
    <label class="control-label" for="<@= id @>">
        <@= label @>
    </label>

    <div class="controls">
        <input id="<@= id @>" name="<@= id @>" type="text" placeholder="<@= placeholder @>" class="form-control <@= inputsize @>"
        <@ if(validations != undefined && validations.required) { @> required="required" <@ } @>>
        <@ if(validations != undefined) { @>
            <span class="hide help-inline control-label"></span>
        <@ } @>
        <@ if (helptext.length > 0) { @>
            <p class="help-block"><@= helptext @></p>
        <@ } @>
    </div>
</div>