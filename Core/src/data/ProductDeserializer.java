package data;

import java.io.IOException;
import java.util.ArrayList;

import com.fasterxml.jackson.core.JsonParser;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.ObjectCodec;
import com.fasterxml.jackson.databind.DeserializationContext;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.deser.std.StdDeserializer;

public class ProductDeserializer extends StdDeserializer<Product>{
	public ProductDeserializer() {
        this(null);
    }
	protected ProductDeserializer(Class<?> vc) {
		super(vc);
		// TODO Auto-generated constructor stub
	}

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
	public Product deserialize(JsonParser parser, DeserializationContext deserializer) {
		Product p = new Product();
        ObjectCodec codec = parser.getCodec();
        JsonNode node;
        try {
			node = codec.readTree(parser);
			JsonNode priceNode = node.get("price");
	        p.setPrice(priceNode.asDouble());
	        JsonNode kitchenNode = node.get("kitchen");
	        p.setKitchen(kitchenNode.asText());
	        JsonNode nameNode = node.get("name");
	        p.setName(nameNode.asText());
	        JsonNode imgNode = node.get("img");
	        p.setImg(imgNode.asText());
	        JsonNode typeNode = node.get("type");
	        p.setType(typeNode.asText());
	        JsonNode ingredientsNode = node.get("ingredients");
	        String ing= ingredientsNode.asText();
	        String ing2[] = ing.split(ing, ',');
	        ArrayList<String> list = new ArrayList<String>();
	        for (String item: ing2) {
	        	list.add(item);
	        }
	        p.setIngredients(list);
	        return p;
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
}
