package models;

import java.lang.reflect.Type;

import play.data.validation.Error;

import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.JsonPrimitive;
import com.google.gson.JsonSerializationContext;
import com.google.gson.JsonSerializer;

public class ErrorTypeAdapter implements JsonSerializer<Error> {
	@Override
	public JsonElement serialize(Error src, Type typeOfSrc, JsonSerializationContext context) {
		JsonArray array = new JsonArray();
		array.add(new JsonPrimitive(src.getKey()));
		array.add(new JsonPrimitive(src.toString()));
		return array;
	}

}
