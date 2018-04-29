package global.sesoc.TOPproject;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.apache.poi.xwpf.converter.pdf.PdfConverter;
import org.apache.poi.xwpf.converter.pdf.PdfOptions;
import org.apache.poi.xwpf.usermodel.XWPFDocument;
import org.docx4j.convert.in.xhtml.XHTMLImporterImpl;
import org.docx4j.openpackaging.packages.WordprocessingMLPackage;
import org.docx4j.openpackaging.parts.WordprocessingML.NumberingDefinitionsPart;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

@Controller
public class EditController {
	
	private static final Logger logger = LoggerFactory.getLogger(EditController.class);
	
	public String fileConverter(HttpSession session, String textt){
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		System.out.println(textt);
		String startHtml = "<!DOCTYPE html[    <!ENTITY nbsp '&#160;'> ]><html><body>";
		String endHtml = "</body></html>";
		StringBuffer sb = new StringBuffer(textt);
		int k = 1;
		
		boolean isImg = false;
		for (int i = 0; i < textt.length(); i++) {
				if(textt.charAt(i) == '<'){
					if(textt.charAt(i+1) == 'i'){
						if(textt.charAt(i+2) == 'm'){
							isImg = true;
							if(isImg){
								System.out.println(isImg);
								loop: 
								for (int j = i; j < textt.length(); j++) {
									System.out.print(textt.charAt(j));
									if (textt.charAt(j) == 'h' && textt.charAt(++j) == 'e'
											&& textt.charAt(++j) == 'i' && textt.charAt(++j) == 'g'
											&& textt.charAt(++j) == 'h' && textt.charAt(++j) == 't'
											&& textt.charAt(++j) == '=' && textt.charAt(++j) == '\"') {
										while (textt.charAt(++j) != '\"') {
											
										}
										System.out.println("여기는 i="+j+" textt.charAt(i)="+textt.charAt(j));
										if (!(textt.charAt(j-2) == 'p' && textt.charAt(j-1) == 'x')) {
											System.out.println("substring(0,j-2)="+textt.substring(0,j));
											System.out.println("substring(j)="+textt.substring(j));
											String a = textt.substring(0,j);
											String b = textt.substring(j);
											textt = a+ "px" + b;
										}
									}
									if (textt.charAt(j) == 'w' && textt.charAt(++j) == 'i'
											&& textt.charAt(++j) == 'd' && textt.charAt(++j) == 't'
											&& textt.charAt(++j) == 'h' && textt.charAt(++j) == '='
											&& textt.charAt(++j) == '\"') {
										while (textt.charAt(++j) != '\"') {
											
										}
										System.out.println("여기는 i="+j+" textt.charAt(i)="+textt.charAt(j));
										if (!(textt.charAt(j-2) == 'p' && textt.charAt(j-1) == 'x')) {
											System.out.println("substring(0,j)="+textt.substring(0,j));
											System.out.println("substring(j)="+textt.substring(j));
											String a = textt.substring(0,j);
											String b = textt.substring(j);
											textt = a+ "px" + b;
											System.out.println("뿅 ="+textt);
										}
									}
									
									
									if(textt.charAt(j) == '/' && textt.charAt(++j) == '>'){

										String newText = textt.substring(0,j-1);
										System.out.println("newText="+newText);
										newText += "></img" + textt.substring(j);
										System.out.println("newText2="+newText);
										textt = newText;
										break loop;
									}
								}
							}
						}
					}
				}
			}

		String text = startHtml + textt + endHtml;
		//String text = "<!DOCTYPE html[    <!ENTITY nbsp '&#160;'> ]><html><body><p>1<span style='font-size:10px'><span style='background-color:#27ae60'>212</span></span>1</p><img src='http://cdn.creamheroes.com/communityImages/mypet/20180101131345446.png' style='width:300px;'></img><table border='1' cellpadding='1' cellspacing='1' style='width:500px'>	<tbody>		<tr>			<td>1</td>			<td>1</td>			<td>2</td>		</tr>		<tr>			<td>3</td>			<td>1</td>			<td>4</td>		</tr>		<tr>			<td>5</td>			<td>1</td>			<td>5</td>		</tr>	</tbody></table><p>ㅇㄴㅇㄴㅇ</p><p>ㅈㄷㅈ&nbsp; &nbsp; ㄷ</p><p>1&nbsp; 2&nbsp; 3 4 5&nbsp;</p></body></html>";
		System.out.println("변환한 애들="+textt);
		try {
            WordprocessingMLPackage wordMLPackage = WordprocessingMLPackage.createPackage();
        	
            NumberingDefinitionsPart ndp = new NumberingDefinitionsPart();
            wordMLPackage.getMainDocumentPart().addTargetPart(ndp);
            ndp.unmarshalDefaultNumbering();
        	
            XHTMLImporterImpl xHTMLImporter = new XHTMLImporterImpl(wordMLPackage);

            xHTMLImporter.setHyperlinkStyle("Hyperlink");

            wordMLPackage.getMainDocumentPart().getContent().addAll( xHTMLImporter.convert(text,null));
            File output = null; // new File("C:/boardfile/html_output4.docx");
            String filename = "";
            
            int number = 1;
            String teamname = "프로젝트명";
            String path = "C:/boardfile/";
            while (true) {
            	filename = teamname + "_" + number +".docx";
            	if (!new File(path+filename).exists()) {
            		break;
            	}
            	number++;
            }
            
            map.put("file", "/TOPproject/boardfile/"+filename);
            String filelink = path+filename; //URLEncoder.encode(path+filename,"UTF-8");
            System.out.println("filelink="+filelink);
            output = new File(filelink);
            wordMLPackage.save(output);
      
            System.out.println("file path where it is stored is" + output.getAbsolutePath());
        }
        catch (Exception e) {
        	System.out.println("에러");
        	map.put("file", null);
            e.printStackTrace();
        }
		System.out.println("끝");
		
		Gson gson = new Gson();
		String json = gson.toJson(map);
		System.out.println("map="+map);
		
		return json;
	}

	//docx 파일로 에디터 저장 후 다운로드까지
	@ResponseBody
	@RequestMapping(value ="makedocx", method = RequestMethod.POST
	, produces = "application/text; charset=utf8")
	public String makeDOCX(HttpSession session, String textt) {
		
		String json = fileConverter(session, textt);

		return json;
	}
	
	//pdf 파일로 에디터 저장 후 다운로드까지
	@ResponseBody
	@RequestMapping(value ="makePDF", method = RequestMethod.POST
	, produces = "application/text; charset=utf8")
	public String makePDF(HttpSession session, String textt) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		String json2 = fileConverter(session, textt);
		String[] s1 = json2.split("boardfile/");
		String[] s2 = s1[1].split(".docx\"}");
		System.out.println("pdf s2 = " + s2[0]);
		String filename = s2[0] +".pdf";
		map.put("file", null);
		try {
			InputStream doc = new FileInputStream(new File("C:/boardfile/"+s2[0]+".docx"));
            XWPFDocument document = new XWPFDocument(doc);
            PdfOptions options = PdfOptions.create();
            OutputStream out = new FileOutputStream(new File("C:/boardfile/"+s2[0]+".pdf"));
            //PdfConverter.getInstance().convert(document, out, options);
            PdfConverter.getInstance().convert(document, out, options);
            System.out.println("Done");
            map.put("file", "/TOPproject/boardfile/"+filename);
		}
		catch (Exception e) {
        	System.out.println("에러");
        	map.put("file", null);
            e.printStackTrace();
        }
		Gson gson = new Gson();
		String json = gson.toJson(map);

		return json;
	}
}
