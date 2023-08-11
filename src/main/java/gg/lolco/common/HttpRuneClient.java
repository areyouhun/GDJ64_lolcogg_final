package gg.lolco.common;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.util.EntityUtils;
import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

@Component
public class HttpRuneClient {
	
	@Value("${lolcogg.datadragon.info.rune}")
	private String URL;
	
	public Map<String, Object> getRune() {
		Map<String, Object> runeMap = new HashMap<>();
		
		try(CloseableHttpClient httpClient = HttpClients.createDefault()) {
			CloseableHttpResponse response = httpClient.execute(new HttpGet(URL));
			
			if(response.getStatusLine().getStatusCode() == 200) {
				JSONArray jsonArray = new JSONArray(EntityUtils.toString(response.getEntity()));
				
				for(int i=0; i<jsonArray.length(); i++) {

					JSONObject slotsObject = jsonArray.getJSONObject(i);
					JSONArray slotsArray = slotsObject.getJSONArray("slots");
					
					runeMap.put(String.valueOf(slotsObject.get("id")), slotsObject.get("icon"));
					
					for(int j=0; j<slotsArray.length(); j++) {
						JSONArray runeArray = slotsArray.getJSONObject(j).getJSONArray("runes");
						
						for(int k=0; k<runeArray.length(); k++) {
							JSONObject runeObject = runeArray.getJSONObject(k);
							
							runeMap.put(String.valueOf(runeObject.get("id")), runeObject.get("icon"));
						}
					}
				}
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return runeMap;
	}
	
	public List<Map<String, Object>> getParseRune(List<Map<String, Object>> param) {
		Map<String, Object> runeMap = getRune();
		
		for(Map<String, Object> map : param) {
			map.replaceAll((key, value) -> {
				if(runeMap.containsKey(value) && !(key.equals("runeCategory") || key.equals("subCategory"))) {
					value = runeMap.get(value);
					return value;
				}
				return value;
			});
		}
		return param;
	}
}
