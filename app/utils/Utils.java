package utils;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;

import play.data.validation.Error;
import play.data.validation.Validation;
import play.mvc.Scope;
import play.mvc.Http.Request;

public class Utils {
	public static void assignCurrentUrl(Request request, Scope.Params params) {
		String url = request.path;
		if (request.querystring != null && request.querystring.length() > 0) {
			url += "?" + request.querystring;
		}
		params.put("url", url);
	}

	public static Map<String, List<Error>> getValidationErrorsForJSON(Validation validation) {

		List<Error> errors = new ArrayList<Error>();
		for (Error e : validation.errors()) {
			errors.add(e);
		}
		Map<String, List<Error>> map = new TreeMap<String, List<Error>>();
		map.put("errors", errors);
		return map;
	}
}
