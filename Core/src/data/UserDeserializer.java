package data;

import java.io.IOException;

import com.fasterxml.jackson.core.JsonParser;
import com.fasterxml.jackson.core.ObjectCodec;
import com.fasterxml.jackson.databind.DeserializationContext;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.deser.std.StdDeserializer;



public class UserDeserializer extends StdDeserializer<User>{

	public UserDeserializer() {
        this(null);
    }
	protected UserDeserializer(Class<?> vc) {
		super(vc);
		// TODO Auto-generated constructor stub
	}

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
	public User deserialize(JsonParser parser, DeserializationContext deserializer) {
		User user = new User();
		
        ObjectCodec codec = parser.getCodec();
        JsonNode node;
		try {
			node = codec.readTree(parser);
			JsonNode idNode = node.get("id");
	        user.setId(idNode.asInt());
	        JsonNode emailNode = node.get("email");
	        user.setEmail(emailNode.asText());
	        JsonNode nameNode = node.get("name");
	        user.setName(nameNode.asText());
	        JsonNode telephoneNode = node.get("telephone");
	        user.setTelephone(telephoneNode.asText());
	        JsonNode address1Node = node.get("address1");
	        user.setAddress1(address1Node.asText());
	        JsonNode address2Node = node.get("address2");
	        user.setAddress2(address2Node.asText());
	        return user;
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
         return null;
        // try catch block
        
	}
	
}
