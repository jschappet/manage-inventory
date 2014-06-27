package edu.uiowa.icts.util;

import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.OutputStream;

import org.apache.batik.transcoder.TranscoderException;
import org.apache.batik.transcoder.TranscoderInput;
import org.apache.batik.transcoder.TranscoderOutput;
import org.apache.batik.transcoder.image.JPEGTranscoder;

public class SVGUtil {
	
	public void transcodeSVG(OutputStream out, byte[] svg) throws TranscoderException, IOException {
		transcodeSVG(out, svg, null, null);
	}
	
	public void transcodeSVG(OutputStream out, byte[] svg, Integer width, Integer height) throws TranscoderException, IOException {
		JPEGTranscoder t = new JPEGTranscoder();
        t.addTranscodingHint(JPEGTranscoder.KEY_QUALITY, new Float(1));
        t.addTranscodingHint(JPEGTranscoder.KEY_ALTERNATE_STYLESHEET, "svg");
        if(width != null){
        	t.addTranscodingHint(JPEGTranscoder.KEY_MAX_WIDTH, new Float(width));
        }
        if(height != null){
        	t.addTranscodingHint(JPEGTranscoder.KEY_MAX_HEIGHT, new Float(height));
        }
        
        ByteArrayInputStream bais = new ByteArrayInputStream(svg);
        TranscoderInput input = new TranscoderInput(bais);
        TranscoderOutput output = new TranscoderOutput(out);

        t.transcode(input, output);
        bais.close();
	}

}
