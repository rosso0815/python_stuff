/**
 * TodoMVC API
 * A simple TodoMVC API
 *
 * OpenAPI spec version: 1.0
 * 
 *
 * NOTE: This class is auto generated by the swagger code generator program.
 * https://github.com/swagger-api/swagger-codegen.git
 * Do not edit the class manually.
 *
 */

import ApiClient from '../ApiClient';

/**
* The Todo model module.
* @module model/Todo
* @version 1.0
*/
export default class Todo {
    /**
    * Constructs a new <code>Todo</code>.
    * @alias module:model/Todo
    * @class
    * @param task {String} The task details
    */

    constructor(task) {
        
        
        this['task'] = task;
        
    }

    /**
    * Constructs a <code>Todo</code> from a plain JavaScript object, optionally creating a new instance.
    * Copies all relevant properties from <code>data</code> to <code>obj</code> if supplied or a new instance if not.
    * @param {Object} data The plain JavaScript object bearing properties of interest.
    * @param {module:model/Todo} obj Optional instance to populate.
    * @return {module:model/Todo} The populated <code>Todo</code> instance.
    */
    static constructFromObject(data, obj) {
        if (data) {
            obj = obj || new Todo();
                        
            
            if (data.hasOwnProperty('id')) {
                obj['id'] = ApiClient.convertToType(data['id'], 'Number');
            }
            if (data.hasOwnProperty('task')) {
                obj['task'] = ApiClient.convertToType(data['task'], 'String');
            }
        }
        return obj;
    }

    /**
    * The task unique identifier
    * @member {Number} id
    */
    'id' = undefined;
    /**
    * The task details
    * @member {String} task
    */
    'task' = undefined;




}
