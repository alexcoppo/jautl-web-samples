<%--
    Copyright (c) 2010-2013 Alessandro Coppo
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
 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="tiles" uri="http://struts.apache.org/tags-tiles"%>

<div>
	<label for="mdengineslist">Engines List</label>
	<select id="mdengineslist">
	</select>
</div>
<br>
<div id="tabs" style="margin-left:10px; overflow:hidden;">
	<ul>
		<li><a href="#tabs-computeHash">Compute Hash</a></li>
		<li><a href="#tabs-runBenchmak">Run Benchmark</a></li>
	</ul>
	<div id="tabs-computeHash">
		<label for="stringToHash">String to hash:</label>
		<input id="stringToHash"><br>
		<br>
		<button id="doHash">Compute digest</button><br>
		<br>
		<div class="results-block">
			<div class="results-item">
				<div class="results-item-label">Hash result</div>
				<div class="results-item-value" id="hashResult" style="max-width: 500px; word-wrap:break-word;"></div>
			</div>
		</div>
	</div>
	<div id="tabs-runBenchmak">
		<label for="blockSize">Block size [b]:</label><input id="blockSize">
		<label for="runTime">Run time [s]:</label><input id="runTime"><br>
		<br>
		<button id="doBenchmark">Run benchmark</button><br>
		<br>
		<div class="results-block">
			<div class="results-item">
				<div class="results-item-label">Loop time</div>
				<div class="results-item-value" id="loopTime"></div>
			</div>
			<div class="results-item">
				<div class="results-item-label">Loops per second</div>
				<div class="results-item-value" id="loopsPerSecond"></div>
			</div>
			<div class="results-item">
				<div class="results-item-label">Throughput</div>
				<div class="results-item-value" id="throughput"></div>
			</div>
		</div>
	</div>
</div>

<div id="progress-dialog" style="display: none;">
<p>Benchmark in progress, please wait...</p>
</div>