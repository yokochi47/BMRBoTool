/*
    BMRBoTool - Ontology tool for NMR-STAR data
    Copyright 2013-2018 Masashi Yokochi
    
    https://github.com/yokochi47/BMRBoTool

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at
    http://www.apache.org/licenses/LICENSE-2.0
Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
 */

import java.io.File;
import java.io.FileOutputStream;

import javax.xml.parsers.*;

import org.w3c.dom.DOMImplementation;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.ls.DOMImplementationLS;
import org.w3c.dom.ls.LSOutput;
import org.w3c.dom.ls.LSSerializer;

public class OWL_ann {

	static OWL_bmrb2pdb bmrb2pdb = new OWL_bmrb2pdb();
	static final String pdbo_ns = "https://rdf.wwpdb.org/schema/pdbx-v50.owl#";

	public static void main(String[] args) {

		final String owl_name = "mmcif_nmr-star.owl";

		String bmrbo_tool_home = ".";

		for (int i = 0; i < args.length; i++) {

			if (args[i].equals("--home"))
				bmrbo_tool_home = args[++i];

			else {
				System.out.println("Usage: --home DIR");
				System.out.println(" --home      DIR  : BMRBoTool home directory. (" + bmrbo_tool_home + ")");

				System.exit(1);
			}

		}

		String owl_dir_name = bmrbo_tool_home + "/schema/"; // schema directory which includes BMRB/OWL file
		String owl_file_name = owl_dir_name + owl_name; // BMRB/OWL file

		File owl_file = new File(owl_file_name);

		if (!owl_file.exists()) {

			System.err.println(owl_file.getPath() + " not found.");
			System.exit(1);

		}

		try {

			// parse OWL document

			DocumentBuilderFactory doc_builder_fac = DocumentBuilderFactory.newInstance();

			doc_builder_fac.setValidating(false);
			doc_builder_fac.setNamespaceAware(true);
			doc_builder_fac.setFeature("http://apache.org/xml/features/nonvalidating/load-dtd-grammar", false);
			doc_builder_fac.setFeature("http://apache.org/xml/features/nonvalidating/load-external-dtd", false);

			DocumentBuilder doc_builder = doc_builder_fac.newDocumentBuilder();

			Document owl_doc = doc_builder.parse(owl_file);

			// OWL document annotation

			owl_ann(owl_doc);

			// write the content into xml file

			DOMImplementation domImpl = owl_doc.getImplementation();
			DOMImplementationLS domImplLS = (DOMImplementationLS) domImpl.getFeature("LS", "3.0");

			LSOutput output = domImplLS.createLSOutput();
			output.setByteStream(new FileOutputStream(owl_dir_name + owl_name));

			LSSerializer serializer = domImplLS.createLSSerializer();
			serializer.getDomConfig().setParameter("format-pretty-print", Boolean.TRUE);
			serializer.write(owl_doc, output);
			/*
			OutputFormat format = new OutputFormat(owl_doc);
			format.setIndenting(true);
			format.setIndent(2);

			FileWriter writer = new FileWriter(new File(owl_dir_name + owl_name));
			XMLSerializer serializer = new XMLSerializer(writer, format);

			serializer.serialize(owl_doc);
			 */
			/*
			TransformerFactory transformerFactory = TransformerFactory.newInstance();
			Transformer transformer = transformerFactory.newTransformer();

			transformer.setOutputProperty(OutputKeys.INDENT, "yes");
			transformer.setOutputProperty(OutputKeys.METHOD, "xml");
			transformer.setOutputProperty("{http://xml.apache.org/xslt}indent-amount", "2");

			DOMSource source = new DOMSource(owl_doc);
			StreamResult result = new StreamResult(new File(owl_dir_name + owl_name));

			// Output to console for testing
			//			StreamResult result = new StreamResult(System.out);

			transformer.transform(source, result);
			 */
		} catch (Exception e) {
			e.printStackTrace();
			System.exit(1);
		}

	}

	private static void owl_ann(Document doc) {

		Element root_node = doc.getDocumentElement();

		if (!root_node.getNodeName().equals("rdf:RDF")) {
			System.err.println("Not found rdf:RDF root element in a document.");
			return;
		}

		for (Node child = root_node.getFirstChild(); child != null; child = child.getNextSibling()) {

			if (child.getNodeName().equals("owl:DatatypeProperty"))
				extract_datatype_property(doc, child);

		}

	}

	private static void extract_datatype_property(Document doc, Node node) {

		Element e = (Element) node;

		String rdf_id = e.getAttribute("rdf:ID");

		if (rdf_id == null || rdf_id.isEmpty() || !rdf_id.matches(".*\\..*pdb.*"))
			return;

		//		System.out.println(rdf_id);

		String pdb_tag = bmrb2pdb.convert(rdf_id);

		if (pdb_tag == null || pdb_tag.isEmpty())
			return;

		boolean has_seealso_pdb = false;

		for (Node child = node.getFirstChild(); child != null; child = child.getNextSibling()) {

			if (child.getNodeName().equals("rdfs:seeAlso")) {

				Element seealso = (Element) child;

				String pdbo = seealso.getAttribute("rdf:resource");

				if (pdbo.contains(pdbo_ns)) {

					has_seealso_pdb = true;

					break;
				}

			}

		}

		if (has_seealso_pdb)
			return;

		System.out.println("BMRBo:" + rdf_id + " rdfs:seeAlso " + "PDBo:" + pdb_tag);

		Element seealso = doc.createElement("rdfs:seeAlso");
		seealso.setAttribute("rdf:resource", pdbo_ns + pdb_tag);
/*
		Element eqpro = doc.createElement("owl:equivalentProperty");
		eqpro.setAttribute("rdf:resource", pdbo_ns + pdb_tag);
*/
		node.appendChild(seealso);

		for (Node child = node.getFirstChild(); child != null; child = child.getNextSibling()) {

			if (child.getNodeName().equals("rdfs:seeAlso")) {

//				node.insertBefore(eqpro, child);

				break;
			}

		}

	}

}
