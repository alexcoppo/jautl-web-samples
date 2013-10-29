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
		<label for="hashResult">Hash result:</label>
		<input id="hashResult" size="64" readonly="readonly">
	</div>
	<div id="tabs-runBenchmak">
		<label for="blockSize">Block size [b]:</label>
		<input id="blockSize"><br>
		<label for="runTime">Run time [s]:</label>
		<input id="runTime"><br>
		<br>
		<button id="doBenchmark">Run benchmark</button><br>
		<br>
		<label for="loopTime">Loop time [us]:</label>
		<input id="loopTime" readonly="readonly"><br>
		<label for="loopsPerSecond">Loops per second:</label>
		<input id="loopsPerSecond" readonly="readonly"><br>
		<label for="throughput">Throughput [b/s]:</label>
		<input id="throughput" readonly="readonly"><br>
	</div>
</div>

<div id="progress-dialog" style="display: none;">
<p>Benchmark in progress, please wait...</p>
</div>