/**
 * This is a generated class and is not intended for modification.  To customize behavior
 * of this value object you may modify the generated sub-class of this class - Root.as.
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
import mx.events.PropertyChangeEvent;
import mx.validators.ValidationResult;
import valueObjects.Details;
import valueObjects.Templates;
import valueObjects.TemplatesService_Products;

import flash.net.registerClassAlias;
import flash.net.getClassByAlias;
import com.adobe.fiber.core.model_internal;
import com.adobe.fiber.valueobjects.IPropertyIterator;
import com.adobe.fiber.valueobjects.AvailablePropertyIterator;

use namespace model_internal;

[ExcludeClass]
public class _Super_Root extends flash.events.EventDispatcher implements com.adobe.fiber.valueobjects.IValueObject
{
    model_internal static function initRemoteClassAliasSingle(cz:Class) : void
    {
    }

    model_internal static function initRemoteClassAliasAllRelated() : void
    {
        valueObjects.Details.initRemoteClassAliasSingleChild();
        valueObjects.Detail.initRemoteClassAliasSingleChild();
        valueObjects.Templates.initRemoteClassAliasSingleChild();
        valueObjects.Template.initRemoteClassAliasSingleChild();
        valueObjects.Product_id.initRemoteClassAliasSingleChild();
        valueObjects.TemplatesService_Products.initRemoteClassAliasSingleChild();
        valueObjects.Product.initRemoteClassAliasSingleChild();
    }

    model_internal var _dminternal_model : _RootEntityMetadata;
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
    private var _internal_details : valueObjects.Details;
    private var _internal_templates : valueObjects.Templates;
    private var _internal_products : valueObjects.TemplatesService_Products;

    private static var emptyArray:Array = new Array();


    /**
     * derived property cache initialization
     */
    model_internal var _cacheInitialized_isValid:Boolean = false;

    model_internal var _changeWatcherArray:Array = new Array();

    public function _Super_Root()
    {
        _model = new _RootEntityMetadata(this);

        // Bind to own data or source properties for cache invalidation triggering
        model_internal::_changeWatcherArray.push(mx.binding.utils.ChangeWatcher.watch(this, "details", model_internal::setterListenerDetails));
        model_internal::_changeWatcherArray.push(mx.binding.utils.ChangeWatcher.watch(this, "templates", model_internal::setterListenerTemplates));

    }

    /**
     * data/source property getters
     */

    [Bindable(event="propertyChange")]
    public function get details() : valueObjects.Details
    {
        return _internal_details;
    }

    [Bindable(event="propertyChange")]
    public function get templates() : valueObjects.Templates
    {
        return _internal_templates;
    }

    [Bindable(event="propertyChange")]
    public function get products() : valueObjects.TemplatesService_Products
    {
        return _internal_products;
    }

    public function clearAssociations() : void
    {
    }

    /**
     * data/source property setters
     */

    public function set details(value:valueObjects.Details) : void
    {
        var oldValue:valueObjects.Details = _internal_details;
        if (oldValue !== value)
        {
            _internal_details = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "details", oldValue, _internal_details));
        }
    }

    public function set templates(value:valueObjects.Templates) : void
    {
        var oldValue:valueObjects.Templates = _internal_templates;
        if (oldValue !== value)
        {
            _internal_templates = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "templates", oldValue, _internal_templates));
        }
    }

    public function set products(value:valueObjects.TemplatesService_Products) : void
    {
        var oldValue:valueObjects.TemplatesService_Products = _internal_products;
        if (oldValue !== value)
        {
            _internal_products = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "products", oldValue, _internal_products));
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

    model_internal function setterListenerDetails(value:flash.events.Event):void
    {
        _model.invalidateDependentOnDetails();
    }

    model_internal function setterListenerTemplates(value:flash.events.Event):void
    {
        _model.invalidateDependentOnTemplates();
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
        if (!_model.detailsIsValid)
        {
            propertyValidity = false;
            com.adobe.fiber.util.FiberUtils.arrayAdd(validationFailureMessages, _model.model_internal::_detailsValidationFailureMessages);
        }
        if (!_model.templatesIsValid)
        {
            propertyValidity = false;
            com.adobe.fiber.util.FiberUtils.arrayAdd(validationFailureMessages, _model.model_internal::_templatesValidationFailureMessages);
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
    public function get _model() : _RootEntityMetadata
    {
        return model_internal::_dminternal_model;
    }

    public function set _model(value : _RootEntityMetadata) : void
    {
        var oldValue : _RootEntityMetadata = model_internal::_dminternal_model;
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

    model_internal var _doValidationCacheOfDetails : Array = null;
    model_internal var _doValidationLastValOfDetails : valueObjects.Details;

    model_internal function _doValidationForDetails(valueIn:Object):Array
    {
        var value : valueObjects.Details = valueIn as valueObjects.Details;

        if (model_internal::_doValidationCacheOfDetails != null && model_internal::_doValidationLastValOfDetails == value)
           return model_internal::_doValidationCacheOfDetails ;

        _model.model_internal::_detailsIsValidCacheInitialized = true;
        var validationFailures:Array = new Array();
        var errorMessage:String;
        var failure:Boolean;

        var valRes:ValidationResult;
        if (_model.isDetailsAvailable && _internal_details == null)
        {
            validationFailures.push(new ValidationResult(true, "", "", "details is required"));
        }

        model_internal::_doValidationCacheOfDetails = validationFailures;
        model_internal::_doValidationLastValOfDetails = value;

        return validationFailures;
    }
    
    model_internal var _doValidationCacheOfTemplates : Array = null;
    model_internal var _doValidationLastValOfTemplates : valueObjects.Templates;

    model_internal function _doValidationForTemplates(valueIn:Object):Array
    {
        var value : valueObjects.Templates = valueIn as valueObjects.Templates;

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
    

}

}
