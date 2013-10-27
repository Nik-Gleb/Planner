/**
 * This is a generated class and is not intended for modification.  To customize behavior
 * of this value object you may modify the generated sub-class of this class - Templates.as.
 */

package valueObjects
{
import com.adobe.fiber.services.IFiberManagingService;
import com.adobe.fiber.util.FiberUtils;
import com.adobe.fiber.valueobjects.IValueObject;
import flash.events.Event;
import flash.events.EventDispatcher;
import mx.binding.utils.ChangeWatcher;
import mx.collections.ArrayCollection;
import mx.events.CollectionEvent;
import mx.events.PropertyChangeEvent;
import mx.validators.ValidationResult;
import valueObjects.Template;

import flash.net.registerClassAlias;
import flash.net.getClassByAlias;
import com.adobe.fiber.core.model_internal;
import com.adobe.fiber.valueobjects.IPropertyIterator;
import com.adobe.fiber.valueobjects.AvailablePropertyIterator;

use namespace model_internal;

[ExcludeClass]
public class _Super_Templates extends flash.events.EventDispatcher implements com.adobe.fiber.valueobjects.IValueObject
{
    model_internal static function initRemoteClassAliasSingle(cz:Class) : void
    {
    }

    model_internal static function initRemoteClassAliasAllRelated() : void
    {
        valueObjects.Template.initRemoteClassAliasSingleChild();
        valueObjects.Product_id.initRemoteClassAliasSingleChild();
    }

    model_internal var _dminternal_model : _TemplatesEntityMetadata;
    model_internal var _changedObjects:mx.collections.ArrayCollection = new ArrayCollection();

    public function getChangedObjects() : Array
    {
        _changedObjects.addItemAt(this,0);
        return _changedObjects.source;
    }

    public function clearChangedObjects() : void
    {
        _changedObjects.removeAll();
    }

    /**
     * properties
     */
    private var _internal_templates : String;
    private var _internal_template : ArrayCollection;
    model_internal var _internal_template_leaf:valueObjects.Template;

    private static var emptyArray:Array = new Array();


    /**
     * derived property cache initialization
     */
    model_internal var _cacheInitialized_isValid:Boolean = false;

    model_internal var _changeWatcherArray:Array = new Array();

    public function _Super_Templates()
    {
        _model = new _TemplatesEntityMetadata(this);

        // Bind to own data or source properties for cache invalidation triggering
        model_internal::_changeWatcherArray.push(mx.binding.utils.ChangeWatcher.watch(this, "templates", model_internal::setterListenerTemplates));
        model_internal::_changeWatcherArray.push(mx.binding.utils.ChangeWatcher.watch(this, "template", model_internal::setterListenerTemplate));

    }

    /**
     * data/source property getters
     */

    [Bindable(event="propertyChange")]
    public function get templates() : String
    {
        return _internal_templates;
    }

    [Bindable(event="propertyChange")]
    public function get template() : ArrayCollection
    {
        return _internal_template;
    }

    public function clearAssociations() : void
    {
    }

    /**
     * data/source property setters
     */

    public function set templates(value:String) : void
    {
        var oldValue:String = _internal_templates;
        if (oldValue !== value)
        {
            _internal_templates = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "templates", oldValue, _internal_templates));
        }
    }

    public function set template(value:*) : void
    {
        var oldValue:ArrayCollection = _internal_template;
        if (oldValue !== value)
        {
            if (value is ArrayCollection)
            {
                _internal_template = value;
            }
            else if (value is Array)
            {
                _internal_template = new ArrayCollection(value);
            }
            else if (value == null)
            {
                _internal_template = null;
            }
            else
            {
                throw new Error("value of template must be a collection");
            }
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "template", oldValue, _internal_template));
        }
    }

    /**
     * Data/source property setter listeners
     *
     * Each data property whose value affects other properties or the validity of the entity
     * needs to invalidate all previously calculated artifacts. These include:
     *  - any derived properties or constraints that reference the given data property.
     *  - any availability guards (variant expressions) that reference the given data property.
     *  - any style validations, message tokens or guards that reference the given data property.
     *  - the validity of the property (and the containing entity) if the given data property has a length restriction.
     *  - the validity of the property (and the containing entity) if the given data property is required.
     */

    model_internal function setterListenerTemplates(value:flash.events.Event):void
    {
        _model.invalidateDependentOnTemplates();
    }

    model_internal function setterListenerTemplate(value:flash.events.Event):void
    {
        if (value is mx.events.PropertyChangeEvent)
        {
            if (mx.events.PropertyChangeEvent(value).newValue)
            {
                mx.events.PropertyChangeEvent(value).newValue.addEventListener(mx.events.CollectionEvent.COLLECTION_CHANGE, model_internal::setterListenerTemplate);
            }
        }
        _model.invalidateDependentOnTemplate();
    }


    /**
     * valid related derived properties
     */
    model_internal var _isValid : Boolean;
    model_internal var _invalidConstraints:Array = new Array();
    model_internal var _validationFailureMessages:Array = new Array();

    /**
     * derived property calculators
     */

    /**
     * isValid calculator
     */
    model_internal function calculateIsValid():Boolean
    {
        var violatedConsts:Array = new Array();
        var validationFailureMessages:Array = new Array();

        var propertyValidity:Boolean = true;
        if (!_model.templatesIsValid)
        {
            propertyValidity = false;
            com.adobe.fiber.util.FiberUtils.arrayAdd(validationFailureMessages, _model.model_internal::_templatesValidationFailureMessages);
        }
        if (!_model.templateIsValid)
        {
            propertyValidity = false;
            com.adobe.fiber.util.FiberUtils.arrayAdd(validationFailureMessages, _model.model_internal::_templateValidationFailureMessages);
        }

        model_internal::_cacheInitialized_isValid = true;
        model_internal::invalidConstraints_der = violatedConsts;
        model_internal::validationFailureMessages_der = validationFailureMessages;
        return violatedConsts.length == 0 && propertyValidity;
    }

    /**
     * derived property setters
     */

    model_internal function set isValid_der(value:Boolean) : void
    {
        var oldValue:Boolean = model_internal::_isValid;
        if (oldValue !== value)
        {
            model_internal::_isValid = value;
            _model.model_internal::fireChangeEvent("isValid", oldValue, model_internal::_isValid);
        }
    }

    /**
     * derived property getters
     */

    [Transient]
    [Bindable(event="propertyChange")]
    public function get _model() : _TemplatesEntityMetadata
    {
        return model_internal::_dminternal_model;
    }

    public function set _model(value : _TemplatesEntityMetadata) : void
    {
        var oldValue : _TemplatesEntityMetadata = model_internal::_dminternal_model;
        if (oldValue !== value)
        {
            model_internal::_dminternal_model = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "_model", oldValue, model_internal::_dminternal_model));
        }
    }

    /**
     * methods
     */


    /**
     *  services
     */
    private var _managingService:com.adobe.fiber.services.IFiberManagingService;

    public function set managingService(managingService:com.adobe.fiber.services.IFiberManagingService):void
    {
        _managingService = managingService;
    }

    model_internal function set invalidConstraints_der(value:Array) : void
    {
        var oldValue:Array = model_internal::_invalidConstraints;
        // avoid firing the event when old and new value are different empty arrays
        if (oldValue !== value && (oldValue.length > 0 || value.length > 0))
        {
            model_internal::_invalidConstraints = value;
            _model.model_internal::fireChangeEvent("invalidConstraints", oldValue, model_internal::_invalidConstraints);
        }
    }

    model_internal function set validationFailureMessages_der(value:Array) : void
    {
        var oldValue:Array = model_internal::_validationFailureMessages;
        // avoid firing the event when old and new value are different empty arrays
        if (oldValue !== value && (oldValue.length > 0 || value.length > 0))
        {
            model_internal::_validationFailureMessages = value;
            _model.model_internal::fireChangeEvent("validationFailureMessages", oldValue, model_internal::_validationFailureMessages);
        }
    }

    model_internal var _doValidationCacheOfTemplates : Array = null;
    model_internal var _doValidationLastValOfTemplates : String;

    model_internal function _doValidationForTemplates(valueIn:Object):Array
    {
        var value : String = valueIn as String;

        if (model_internal::_doValidationCacheOfTemplates != null && model_internal::_doValidationLastValOfTemplates == value)
           return model_internal::_doValidationCacheOfTemplates ;

        _model.model_internal::_templatesIsValidCacheInitialized = true;
        var validationFailures:Array = new Array();
        var errorMessage:String;
        var failure:Boolean;

        var valRes:ValidationResult;
        if (_model.isTemplatesAvailable && _internal_templates == null)
        {
            validationFailures.push(new ValidationResult(true, "", "", "templates is required"));
        }

        model_internal::_doValidationCacheOfTemplates = validationFailures;
        model_internal::_doValidationLastValOfTemplates = value;

        return validationFailures;
    }
    
    model_internal var _doValidationCacheOfTemplate : Array = null;
    model_internal var _doValidationLastValOfTemplate : ArrayCollection;

    model_internal function _doValidationForTemplate(valueIn:Object):Array
    {
        var value : ArrayCollection = valueIn as ArrayCollection;

        if (model_internal::_doValidationCacheOfTemplate != null && model_internal::_doValidationLastValOfTemplate == value)
           return model_internal::_doValidationCacheOfTemplate ;

        _model.model_internal::_templateIsValidCacheInitialized = true;
        var validationFailures:Array = new Array();
        var errorMessage:String;
        var failure:Boolean;

        var valRes:ValidationResult;
        if (_model.isTemplateAvailable && _internal_template == null)
        {
            validationFailures.push(new ValidationResult(true, "", "", "template is required"));
        }

        model_internal::_doValidationCacheOfTemplate = validationFailures;
        model_internal::_doValidationLastValOfTemplate = value;

        return validationFailures;
    }
    

}

}
