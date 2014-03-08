/*
    Copyright (c) 2010-2014 Alessandro Coppo
    All rights reserved.

    Redistribution and use in source and binary forms, with or without
    modification, are permitted provided that the following conditions
    are met:
    1. Redistributions of source code must retain the above copyright
       notice, this list of conditions and the following disclaimer.
    2. Redistributions in binary form must reproduce the above copyright
       notice, this list of conditions and the following disclaimer in the
       documentation and/or other materials provided with the distribution.
    3. The name of the author may not be used to endorse or promote products
       derived from this software without specific prior written permission.

    THIS SOFTWARE IS PROVIDED BY THE AUTHOR ``AS IS'' AND ANY EXPRESS OR
    IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES
    OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED.
    IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR ANY DIRECT, INDIRECT,
    INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT
    NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
    DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
    THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
    (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF
    THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
*/
package it.webalice.alexcoppo.jautl.websamples.md;

import it.webalice.alexcoppo.jautl.websamples.util.AJAXAction;

import javax.servlet.http.HttpServletRequest;

import net.sf.jautl.json.JSONObjectBuilder;
import net.sf.jautl.md.DigestEngine;
import net.sf.jautl.md.DigestEngineFactory;
import net.sf.jautl.text.EngineeringFormatter;
import net.sf.jautl.text.NumericFormatter.UnitMode;
import net.sf.jautl.text.ProgrammerFormatter;
import net.sf.jautl.utility.benchmark.Benchmarker;

public class BenchmarkEngineAction extends AJAXAction {
	@Override
	protected String processAction(HttpServletRequest request) {
		JSONObjectBuilder job = new JSONObjectBuilder();

		String digestName = (String)request.getParameter("digestName");
		int blockSize = Integer.parseInt((String)request.getParameter("blockSize"));
		double runTime = Double.parseDouble((String)request.getParameter("runTime"));
		
		DigestEngine de = DigestEngineFactory.create(digestName);
		if (de != null) {
	        MDAdaptor mda = new MDAdaptor(de, blockSize);
	        long loopsCount = Benchmarker.estimateLoopCount(mda, runTime);
	        double totalTime = Benchmarker.benchmark(mda, loopsCount);
	    
			EngineeringFormatter ef = new EngineeringFormatter();
	        ef.setUnitMode(UnitMode.Symbol);
	        ef.setMantissaDigits(3);

			ef.format(totalTime / loopsCount);
			String loopTime = ef.buildString() + "s"; 
			job.put("loopTime", loopTime);

			ef.format(loopsCount / totalTime);
			String loopsPerSecond = ef.buildString();
			job.put("loopsPerSecond", loopsPerSecond);
			
	        ProgrammerFormatter pf = new ProgrammerFormatter();
	        pf.setUnitMode(UnitMode.Symbol);
	        pf.setMantissaDigits(3);
			
			pf.format((long)(blockSize * loopsCount / totalTime));
			String throughput =  pf.buildString() + "B/s";
			job.put("throughput", throughput);
			
			job.put("status", "ok");
		} else
			job.put("status", "ko");
		
		return job.asString();
	}
}
