/**
 * This is a generated class and is not intended for modification.  To customize behavior
 * of this value object you may modify the generated sub-class of this class - TemplatesService_Products.as.
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
import valueObjects.Product;

import flash.net.registerClassAlias;
import flash.net.getClassByAlias;
import com.adobe.fiber.core.model_internal;
import com.adobe.fiber.valueobjects.IPropertyIterator;
import com.adobe.fiber.valueobjects.AvailablePropertyIterator;

use namespace model_internal;

[ExcludeClass]
public class _Super_TemplatesService_Products extends flash.events.EventDispatcher implements com.adobe.fiber.valueobjects.IValueObject
{
    model_internal static function initRemoteClassAliasSingle(cz:Class) : void
    {
    }

    model_internal static function initRemoteClassAliasAllRelated() : void
    {
        valueObjects.Product.initRemoteClassAliasSingleChild();
    }

    model_internal var _dminternal_model : _TemplatesService_ProductsEntityMetadata;
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
    private var _internal_products : String;
    private var _internal_product : ArrayCollection;
    model_internal var _internal_product_leaf:valueObjects.Product;

    private static var emptyArray:Array = new Array();


    /**
     * derived property cache initialization
     */
    model_internal var _cacheInitialized_isValid:Boolean = false;

    model_internal var _changeWatcherArray:Array = new Array();

    public function _Super_TemplatesService_Products()
    {
        _model = new _TemplatesService_ProductsEntityMetadata(this);

        // Bind to own data or source properties for cache invalidation triggering
        model_internal::_changeWatcherArray.push(mx.binding.utils.ChangeWatcher.watch(this, "products", model_internal::setterListenerProducts));
        model_internal::_changeWatcherArray.push(mx.binding.utils.ChangeWatcher.watch(this, "product", model_internal::setterListenerProduct));

    }

    /**
     * data/source property getters
     */

    [Bindable(event="propertyChange")]
    public function get products() : String
    {
        return _internal_products;
    }

    [Bindable(event="propertyChange")]
    public function get product() : ArrayCollection
    {
        return _internal_product;
    }

    public function clearAssociations() : void
    {
    }

    /**
     * data/source property setters
     */

    public function set products(value:String) : void
    {
        var oldValue:String = _internal_products;
        if (oldValue !== value)
        {
            _internal_products = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "products", oldValue, _internal_products));
        }
    }

    public function set product(value:*) : void
    {
        var oldValue:ArrayCollection = _internal_product;
        if (oldValue !== value)
        {
            if (value is ArrayCollection)
            {
                _internal_product = value;
            }
            else if (value is Array)
            {
                _internal_product = new ArrayCollection(value);
            }
            else if (value == null)
            {
                _internal_product = null;
            }
            else
            {
                throw new Error("value of product must be a collection");
            }
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "product", oldValue, _internal_product));
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

    model_internal function setterListenerProducts(value:flash.events.Event):void
    {
        _model.invalidateDependentOnProducts();
    }

    model_internal function setterListenerProduct(value:flash.events.Event):void
    {
        if (value is mx.events.PropertyChangeEvent)
        {
            if (mx.events.PropertyChangeEvent(value).newValue)
            {
                mx.events.PropertyChangeEvent(value).newValue.addEventListener(mx.events.CollectionEvent.COLLECTION_CHANGE, model_internal::setterListenerProduct);
            }
        }
        _model.invalidateDependentOnProduct();
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
        if (!_model.productsIsValid)
        {
            propertyValidity = false;
            com.adobe.fiber.util.FiberUtils.arrayAdd(validationFailureMessages, _model.model_internal::_productsValidationFailureMessages);
        }
        if (!_model.productIsValid)
        {
            propertyValidity = false;
            com.adobe.fiber.util.FiberUtils.arrayAdd(validationFailureMessages, _model.model_internal::_productValidationFailureMessages);
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
    public function get _model() : _TemplatesService_ProductsEntityMetadata
    {
        return model_internal::_dminternal_model;
    }

    public function set _model(value : _TemplatesService_ProductsEntityMetadata) : void
    {
        var oldValue : _TemplatesService_ProductsEntityMetadata = model_internal::_dminternal_model;
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

    model_internal var _doValidationCacheOfProducts : Array = null;
    model_internal var _doValidationLastValOfProducts : String;

    model_internal function _doValidationForProducts(valueIn:Object):Array
    {
        var value : String = valueIn as String;

        if (model_internal::_doValidationCacheOfProducts != null && model_internal::_doValidationLastValOfProducts == value)
           return model_internal::_doValidationCacheOfProducts ;

        _model.model_internal::_productsIsValidCacheInitialized = true;
        var validationFailures:Array = new Array();
        var errorMessage:String;
        var failure:Boolean;

        var valRes:ValidationResult;
        if (_model.isProductsAvailable && _internal_products == null)
        {
            validationFailures.push(new ValidationResult(true, "", "", "products is required"));
        }

        model_internal::_doValidationCacheOfProducts = validationFailures;
        model_internal::_doValidationLastValOfProducts = value;

        return validationFailures;
    }
    
    model_internal var _doValidationCacheOfProduct : Array = null;
    model_internal var _doValidationLastValOfProduct : ArrayCollection;

    model_internal function _doValidationForProduct(valueIn:Object):Array
    {
        var value : ArrayCollection = valueIn as ArrayCollection;

        if (model_internal::_doValidationCacheOfProduct != null && model_internal::_doValidationLastValOfProduct == value)
           return model_internal::_doValidationCacheOfProduct ;

        _model.model_internal::_productIsValidCacheInitialized = true;
        var validationFailures:Array = new Array();
        var errorMessage:String;
        var failure:Boolean;

        var valRes:ValidationResult;
        if (_model.isProductAvailable && _internal_product == null)
        {
            validationFailures.push(new ValidationResult(true, "", "", "product is required"));
        }

        model_internal::_doValidationCacheOfProduct = validationFailures;
        model_internal::_doValidationLastValOfProduct = value;

        return validationFailures;
    }
    

}

}
