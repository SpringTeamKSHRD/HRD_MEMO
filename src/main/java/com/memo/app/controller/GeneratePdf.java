package com.memo.app.controller;

import java.io.OutputStream;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.itextpdf.text.BaseColor;
import com.itextpdf.text.Document;
import com.itextpdf.text.Font;
import com.itextpdf.text.FontFactory;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.pdf.PdfWriter;
@Controller
public class GeneratePdf {
	@RequestMapping(value = "/getpdffile",method=RequestMethod.GET)
    public void pdfReport(ModelMap model, HttpServletResponse response, HttpServletRequest     request, OutputStream outputStream,@RequestParam("title") String title,
    						@RequestParam("content") String content) throws Exception
    {
          
		   response.setContentType("application/pdf");
           response.setHeader("Content-Disposition", "attachment; filename=HRDMMEMO.pdf");
           Document document = new Document();
           PdfWriter.getInstance(document, outputStream);
           document.open();
           
           document.add(new Paragraph("Title: "+title,FontFactory.getFont(FontFactory.TIMES_ITALIC,14,Font.BOLD,BaseColor.BLUE)));
           document.add(new Paragraph(content));
           document.addCreationDate();

           document.close();
          
    }
	@RequestMapping(value = "/testpdf")
    public String getTestPage()
    {
         return "testpdf";
    }
}

