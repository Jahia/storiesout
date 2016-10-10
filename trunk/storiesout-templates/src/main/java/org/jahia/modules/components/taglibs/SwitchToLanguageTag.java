package org.jahia.modules.components.taglibs;

import org.jahia.taglibs.AbstractJahiaTag;
import org.jahia.utils.LanguageCodeConverters;
import org.slf4j.Logger;

import java.io.IOException;
import java.util.Locale;

public class SwitchToLanguageTag extends AbstractJahiaTag {

    private static final transient Logger logger = org.slf4j.LoggerFactory.getLogger(SwitchToLanguageTag.class);

    private String languageCode;


    public String getLanguageCode() {
        return languageCode;
    }

    public void setLanguageCode(String languageCode) {
        this.languageCode = languageCode;
    }

    public int doStartTag() {
        try {
            final StringBuilder buff = new StringBuilder(300);

            final String currentLocale = getCurrentResource().getLocale().getLanguage();
            final Locale locale = LanguageCodeConverters.languageCodeToLocale(languageCode);
            final String displayLanguage = locale.getDisplayLanguage(locale);
            final String link = generateCurrentNodeLangSwitchLink(languageCode);

            // finish anchor tag
            // <a class="btn btn-sm btn-primary active" title="French" href="#"><img src="${url.currentModule}/img/fr.png" alt="French"></a>
            buff.append("<a class=\"btn btn-sm ");
            if (currentLocale.equals(languageCode)) {
                buff.append(" btn-primary active");
            } else {
                buff.append(" btn-inverse");
            }
            buff.append("\" title=\"").append(displayLanguage).append("\" href=\"").append(link).
                    append("\">").append(languageCode.toUpperCase()).append("</a>");

            pageContext.getOut().print(buff.toString());
        } catch (IOException e) {
            logger.error("Error while getting language switch URL", e);
        }

        return SKIP_BODY;
    }
}