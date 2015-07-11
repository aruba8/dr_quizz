--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: alembic_version; Type: TABLE; Schema: public; Owner: dr_quiz_db; Tablespace: 
--

CREATE TABLE alembic_version (
    version_num character varying(32) NOT NULL
);


ALTER TABLE alembic_version OWNER TO dr_quiz_db;

--
-- Name: answer; Type: TABLE; Schema: public; Owner: dr_quiz_db; Tablespace: 
--

CREATE TABLE answer (
    id integer NOT NULL,
    question_id integer NOT NULL,
    answer character varying(1000) NOT NULL,
    is_correct_answer boolean
);


ALTER TABLE answer OWNER TO dr_quiz_db;

--
-- Name: answer_id_seq; Type: SEQUENCE; Schema: public; Owner: dr_quiz_db
--

CREATE SEQUENCE answer_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE answer_id_seq OWNER TO dr_quiz_db;

--
-- Name: answer_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dr_quiz_db
--

ALTER SEQUENCE answer_id_seq OWNED BY answer.id;


--
-- Name: question; Type: TABLE; Schema: public; Owner: dr_quiz_db; Tablespace: 
--

CREATE TABLE question (
    id integer NOT NULL,
    question character varying(1000) NOT NULL,
    real_id integer NOT NULL,
    signed boolean,
    sign_name character varying(100)
);


ALTER TABLE question OWNER TO dr_quiz_db;

--
-- Name: question_id_seq; Type: SEQUENCE; Schema: public; Owner: dr_quiz_db
--

CREATE SEQUENCE question_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE question_id_seq OWNER TO dr_quiz_db;

--
-- Name: question_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dr_quiz_db
--

ALTER SEQUENCE question_id_seq OWNED BY question.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: dr_quiz_db
--

ALTER TABLE ONLY answer ALTER COLUMN id SET DEFAULT nextval('answer_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: dr_quiz_db
--

ALTER TABLE ONLY question ALTER COLUMN id SET DEFAULT nextval('question_id_seq'::regclass);


--
-- Data for Name: alembic_version; Type: TABLE DATA; Schema: public; Owner: dr_quiz_db
--

COPY alembic_version (version_num) FROM stdin;
527a11ac7945
\.


--
-- Data for Name: answer; Type: TABLE DATA; Schema: public; Owner: dr_quiz_db
--

COPY answer (id, question_id, answer, is_correct_answer) FROM stdin;
1	1	drive during the grace period of 90 days	f
2	1	drive during the grace period of 30 days	f
3	1	drive during the grace period of 60 days	f
5	2	check ahead for oncoming traffic and check behind using your rearview and side mirrors for vehicles approaching from behind	f
6	2	signal, check the blind spot on the side you wish to move towards	f
7	2	once the vehicle you have passed is visible in your rearview mirror, check your blind spot on the side you wish to move towards and return to the proper lane	f
9	3	proceed through red lights	f
10	3	proceed through a stop	f
11	3	obtain the right-of-way from all other drivers	f
13	4	yield if parked cars are on your side of the road	f
15	4	make the other vehicle pull over if you were the first vehicle there	f
16	4	turn on your headlights to make sure the other vehicle sees you	f
18	5	you may pass a slow moving vehicle here if you can pass quickly	f
19	5	it's all right to pass here if you 'know the road ahead'	f
20	5	it's all right to pass here except at night	f
22	6	April 1 and October 1	f
23	6	April 30 and October 31	f
24	6	April 1 and October 31	f
25	7	put on your 4-way flashers	f
27	7	use your high beams and 4-way flashers	f
28	7	continue at your present speed	f
29	8	your sight line is limited	f
30	8	you should remain patient and follow all the way over the crest before passing	f
31	8	you should observe the pavement marking and road signs	f
33	9	slow down to before leaving the freeway	f
35	9	consider using	f
36	9	none of the above	f
37	10	jerk the steering wheel to force the vehicle back onto the pavement	f
38	10	speed up and steer back onto the pavement gradually	f
39	10	brake quickly and firmly	f
41	11	only when driving in the city	f
42	11	only when carrying passengers	f
44	11	only when driving on the highway	f
45	12	not give any signal	f
47	12	give a proper turn signal	f
48	12	warn other drivers by blowing the horn	f
50	13	two years	f
51	13	five years	f
52	13	6 months	f
53	14	municipal road ends	f
55	14	roads meet	f
56	14	overpass ahead	f
57	15	entering town limits	f
59	15	turn ahead	f
60	15	road ends	f
61	16	road narrows	f
62	16	no shoulders	f
63	16	speed zone	f
65	17	maximum truck speed 40 km/h when meeting traffic	f
67	17	maximum passing speed 40 km/h on curve ahead	f
68	17	maximum speed 40 km/h when passing	f
70	18	building area	f
71	18	equipment ahead	f
72	18	ditch digging equipment ahead	f
74	19	road closure	f
75	19	no passing	f
76	19	forest fire ahead	f
77	20	right turns allowed	f
79	20	right turn on red	f
80	20	no right turn allowed	f
4	1	not drive	t
8	2	all of the above	t
12	3	all of the above	t
14	4	allow the on-coming vehicle at least one-half of the main traveled portion of the road	t
17	5	you must not pass another vehicle where these signs are posted	t
21	6	April 30 to October 1	t
26	7	cautiously pull off the pavement and stop in a safe location. Wait until visibility improves	t
32	8	all of the above	t
34	9	slow down to while on the freeway exit ramp	t
40	10	steer in a straight line and take your foot off the accelerator	t
43	11	all the time unless exempted by law	t
46	12	give proper signal and look to be sure the change can be made safely	t
49	13	one year	t
54	14	road ends - exit right or left	t
58	15	two-way traffic ahead	t
64	16	narrow bridge ahead	t
66	17	maximum speed 40 km/h when meeting traffic	t
69	18	construction area	t
73	19	detour ahead	t
78	20	no right turn on red signal	t
81	21	extension coverage for a vehicle that is currently registered and insured in the student's home jurisdiction	f
83	21	no extra insurance is required	f
84	21	both a and b	f
85	22	the road is under repair	f
86	22	you are on a one-way road	f
88	22	that you must stay to the left of the broken yellow lines	f
89	23	the area in front of the truck	f
90	23	the area directly behind the truck	f
91	23	the sides of the truck	f
93	24	you may proceed through the intersection without stopping again	f
95	24	you may go through the intersection slowly without stopping if there is no other traffic	f
96	24	you may follow the vehicle ahead without stopping again	f
97	25	1.2 mm	f
99	25	2.4 mm	f
100	25	1.8 mm	f
102	26	be equipped with a flashing green light and display an illuminated 'WIDE LOAD' or 'D' sign	f
103	26	be equipped with a flashing red light	f
104	26	be equipped with a flashing yellow light	f
87	22	you are on a two-way road	t
92	23	all of the above	t
94	24	you must stop again at the stop line	t
98	25	1.6 mm	t
101	26	be equipped with a flashing yellow light and display an illuminated 'WIDE LOAD' or 'D' sign	t
105	27	50 metres	f
106	27	20 metres	f
108	27	60 metres	f
109	28	jam on your brakes while in a curve	f
110	28	accelerate rapidly in a curve	f
112	28	stay away to the outside of the curve	f
113	29	pump the brake pedal	f
115	29	slam on the brakes and release the brakes when the pedal vibrates	f
116	29	apply as little pressure as possible	f
117	30	step out of the vehicle immediately	f
118	30	stay inside and try to drive away from the wires	f
119	30	if you cannot drive away from the wires or your vehicle is on fire and you must leave it, do so by jumping out so as not to come in contact with both the vehicle and the ground	f
121	31	move to the left so you cannot be passed	f
123	31	speed up to get out of the way	f
124	31	do not reduce your speed	f
126	32	going five kms below the speed limit	f
127	32	driving with the flow of traffic	f
128	32	doing the speed limit	f
129	33	25 per cent	f
130	33	15 per cent	f
131	33	7 per cent	f
133	34	sharp right curve, trucks maximum speed 40 km/h	f
134	34	curve in road	f
135	34	sharp turn	f
137	35	truck ahead	f
139	35	trucks turning	f
140	35	loss of traction	f
142	36	entering two-way roadway	f
143	36	slow down	f
144	36	turn right	f
145	37	right turn only	f
147	37	no right turns between 08:00 - 17:30	f
148	37	truck lane only	f
150	38	trucks only	f
151	38	buses only 08:30 - 17:30	f
152	38	school bus only	f
153	39	no traffic allowed	f
155	39	trucks allowed	f
156	39	no cars allowed	f
82	21	a student sticker for a vehicle that is currently registered and insured in the student's home jurisdiction	t
107	27	30 metres	t
111	28	slow down before entering a curve and avoid braking in the curve	t
114	29	slam on the brakes and keep the brake pedal depressed	t
120	30	both b and c	t
122	31	slow down and move to the right	t
125	32	speed that allows you to stop for an emergency	t
132	33	3 per cent	t
136	34	sharp right curve maximum speed 40 km/h	t
138	35	steep hill ahead	t
141	36	merging roadways ahead	t
146	37	reserved lane located in curb lane	t
149	38	buses only	t
154	39	no trucks allowed	t
157	40	daydreams or gazes at objects off the roadway while driving	f
158	40	carries on an eye-contact conversation with a passenger while driving	f
159	40	restricts attention to only watching the vehicle ahead	f
161	41	may be safely held by a strong adult	f
163	41	will be safe if standing on the floor in the front or back of an auto	f
164	41	will not be hurt in an accident because they are small	f
165	42	a forward-facing child car seat	f
167	42	a booster seat	f
168	42	a secured seatbelt	f
170	43	50 metres before the turn	f
171	43	100 metres before the turn	f
172	43	30 metres before the turn	f
173	44	6 months	f
174	44	9 months	f
175	44	12 months	f
177	45	traffic is moving in the same direction	f
179	45	you are in a parking lane	f
180	45	no passing is allowed	f
182	46	traffic is moving in the opposite direction	f
183	46	you are in a parking lane	f
184	46	no passing is allowed	f
185	47	within 6 metres from the point on the curb or edge of the roadway immediately opposite a fire hydrant	f
187	47	within 10 metres of the nearest rail of a railway crossing, unless otherwise posted	f
188	47	all of the above	f
189	48	stop and check with the police officer	f
190	48	wait for the green light	f
192	48	make a U-turn and avoid the intersection	f
193	49	press the brakes lightly to check for responsiveness	f
194	49	drive slowly and apply brakes lightly to dry them	f
195	49	just keep driving. The brakes will not be affected	f
197	50	have done as much as you can	f
198	50	must stay until the police arrive	f
200	50	must stay until the owner returns	f
201	51	speed up	f
203	51	honk your horn and proceed	f
204	51	go when the train blows its horn	f
206	52	icy road	f
207	52	no spinning of tires	f
208	52	trucks must use low gear	f
160	40	all of the above	t
162	41	must never be allowed to ride standing on a seat	t
166	42	a rear-facing infant car seat	t
169	43	150 metres before the turn	t
176	44	15 months	t
178	45	traffic is moving in the opposite direction	t
181	46	traffic is moving in the same direction	t
186	47	within 9 metres of a stop sign or other traffic sign posted at an intersection	t
191	48	go on as directed	t
196	49	both a and b	t
199	50	must leave a written notice your name, address and circumstances of the accident	t
202	51	always yield the right of way to a train	t
205	52	road slippery when wet	t
209	53	you can drive better	f
211	53	you'll have to drive slower	f
212	53	all of the above	f
213	54	is loose	f
215	54	is hidden beneath the seat	f
216	54	keeps the seat belt buzzer or light from operating	f
217	55	50 metres	f
219	55	10 metres	f
220	55	25 metres	f
221	56	the vehicle is brought to a complete stop and gates or barriers do not protect the crossing	f
222	56	the crossing is within a restricted speed area	f
223	56	the train is stopped or is a safe distance away and the crossing may be done safely	f
225	57	the lanes are marked by double broken lines and white diamond patterns	f
226	57	traffic signs identify the vehicles and the times that the lanes are reserved	f
227	57	motorists making a right turn are permitted to enter the reserved lane at any point in the block preceding their turn	f
229	58	speed up and get through the intersection	f
231	58	drive into the intersection and make the other vehicle stop	f
232	58	honk your horn and drive through the intersection	f
233	59	stop as quickly as you can	f
235	59	disregard the emergency vehicle as it is going the other way	f
236	59	none of the above	f
237	60	if you are reversing straight back or to the right, look over your right shoulder	f
238	60	use your rear view mirror when backing up	f
239	60	if reversing to the left, look over your left shoulder	f
242	61	accelerate quickly to clear the intersection	f
243	61	honk your horn and then accelerate normally	f
244	61	accelerate normally as you have the right-of-way	f
246	62	slow down and yield the right of way	f
247	62	stop only if turning left	f
248	62	be prepared to stop	f
250	63	look away to the left edge of the roadway just as you meet the vehicle	f
251	63	wear sunglasses just as you meet the vehicle	f
252	63	stare at the oncoming lights just as you meet the vehicle	f
253	64	pass the stopped vehicle on the right slowly	f
254	64	blow your horn so the pedestrian knows you are passing	f
256	64	carefully pass the stopped car on the left	f
257	65	wet roads	f
258	65	slippery when wet	f
259	65	falling Rocks	f
261	66	construction zone	f
263	66	gravel surface	f
264	66	broken road surface	f
266	67	no turns allowed	f
267	67	right turn lane ahead	f
268	67	no backing allowed	f
269	68	maximum recommended for trucks	f
270	68	maximum speed when slippery	f
271	68	maximum speed when wet	f
210	53	a charge of impaired driving can be laid regardless of what level of alcohol is found in your blood	t
214	54	is buckled snugly across your hipbones, shoulder and lower abdomen	t
218	55	30 metres	t
224	56	all of the above conditions are met	t
228	57	all of the above	t
230	58	slow down and yield the right of way to the vehicle on the right	t
234	59	slow down; move as far to the right as possible and stop	t
240	60	both a and c	t
241	61	check left, centre, right and then left again before proceeding	t
245	62	come to a complete stop before the intersection. Check the traffic and go when it is safe	t
249	63	look away to the right edge of the roadway just as you meet the vehicle	t
255	64	not pass any car and allow the pedestrian to cross the street	t
260	65	flying stones	t
262	66	part of roadway has been removed	t
265	67	proceed in direction of arrow only	t
272	68	maximum recommended speed on exit 40 km/h	t
273	69	is purposely in a hurry, competing with other traffic	f
274	69	shows little or no respect for traffic laws, or the right-of-way of others	f
275	69	is someone to avoid, when you're driving	f
278	70	talking to yourself	f
279	70	following other traffic	f
280	70	tuning the radio	f
281	71	4.0	f
282	71	1.0	f
284	71	5.0	f
285	72	turned toward the curb	f
287	72	turned straight ahead	f
288	72	it doesn't matter in which position	f
289	73	100 metres	f
291	73	120 metres	f
292	73	130 metres	f
293	74	adjust your speed to match traffic and keep plenty of space between you and the vehicle ahead, so that you and the vehicle behind you will have more time and distance to stop in an emergency	f
294	74	check expressway traffic to determine if it will be necessary for you to slow down or stop at the point immediately before the entrance to the merge lane	f
295	74	use the merge lane to match your speed with expressway traffic, so as to merge without having to stop. If you stop at the end of the entrance lane, you sharply increase the risk of being struck from behind	f
297	75	stop immediately and help the injured, if there are any	f
298	75	exchange names, addresses, driver's licence and registration numbers, if damage to any vehicle or property has occurred	f
299	75	file a police report if damage to the vehicles exceeds $1,000 or there is an injury	f
302	76	not move your vehicle under any circumstances	f
303	76	wait until the police arrive before you move your vehicle	f
304	76	none of the above	f
305	77	the lights are not working	f
306	77	stop until the light stops flashing	f
277	70	seeing	t
283	71	6.0	t
290	73	110 metres	t
296	74	all of the above	t
300	75	all of the above	t
307	77	be prepared to stop and yield the right-of-way to pedestrians	t
308	77	a warning that the light will turn red	f
309	78	in the second lane from the right side of the roadway	f
311	78	any lane on your side of the roadway	f
312	78	close to the center line of the roadway	f
314	79	stop when requested	f
315	79	yield	f
316	79	proceed if safe	f
318	80	playground area	f
319	80	public gardens ahead	f
320	80	tree plantation ahead	f
321	81	enter at your own risk	f
322	81	road ends	f
323	81	road closed	f
325	82	exit ahead	f
326	82	left turning lane ahead	f
327	82	two-way traffic ahead	f
329	83	school crosswalk	f
330	83	playground crosswalk ahead	f
332	83	construction ahead	f
276	69	all of the above	t
286	72	turned away from the curb	t
301	76	if possible, and safe to do so, move your vehicle off of the travelled portion of the roadway	t
310	78	close to the right side of the roadway	t
313	79	stop	t
317	80	road work	t
324	81	do not enter	t
328	82	this lane must turn left	t
331	83	pedestrian crosswalk	t
334	84	only a problem to their passengers	f
335	84	not a problem in Manitoba	f
336	84	a police enforcement problem only	f
337	85	only if you are convicted of driving while under the influence of alcohol	f
338	85	only if you are convicted of a major traffic violation	f
340	85	none of the above are true	f
341	86	a bad driving habit	f
343	86	unnecessary	f
344	86	not necessary if you use your mirrors properly	f
345	87	signal your intentions	f
346	87	make sure your blind spot is clear	f
347	87	make sure that there is sufficient room in traffic to make the move	f
349	88	close enough so no one will cut in front of you	f
351	88	one car length for every 10 km/h	f
352	88	found by spacing your vehicle at least 2 seconds behind the vehicle ahead	f
353	89	speed up and finish passing as soon as you can	f
354	89	pass on the right	f
356	89	stay beside the car until passing the intersection	f
358	90	proceed normally	f
359	90	not stop until the person steps onto the roadway	f
360	90	honk the horn three times	f
361	91	you should maintain your vehicle's speed till after you get to the slower speed zone	f
363	91	it's dangerous to slow down because traffic starts to back up	f
364	91	the sign is only meant for slower drivers	f
365	92	rear-view mirror and an outside left mirror	f
366	92	rear-view mirror and an outside right mirror	f
368	92	rear-view mirror only	f
369	93	a sign tells you not to	f
370	93	it is night time	f
372	93	other vehicles are stopped	f
373	94	15 metres	f
374	94	3 metres	f
376	94	5 metres	f
377	95	0 blood alcohol content	f
379	95	.07 blood alcohol content	f
380	95	.08 blood alcohol content	f
382	96	playground crosswalk ahead	f
383	96	children playing ahead	f
384	96	school ahead	f
385	97	merging traffic	f
386	97	speed up	f
387	97	slow down	f
389	98	wildlife sanctuary	f
391	98	municipal animal pound	f
392	98	provincial park entrance ahead	f
393	99	pedestrian crosswalk ahead	f
394	99	children at play	f
395	99	playground area ahead	f
397	100	road merges	f
398	100	construction ahead	f
400	100	speed limit ahead	f
401	101	one-way traffic	f
402	101	two-way traffic	f
403	101	turns allowed	f
333	84	every driver's problem whether they drink or not	t
339	85	automatically because you have refused to take the test	t
342	86	a good driving habit	t
348	87	all of the above	t
350	88	found by spacing your vehicle at least 4 seconds behind the vehicle ahead	t
355	89	drop back and pass after the intersection when safe to do so	t
357	90	stop and give the right of way	t
362	91	you should begin to reduce your vehicle's speed	t
367	92	rear-view mirror and outside mirrors on the right and left sides	t
371	93	other vehicles are slowing down or stopped	t
375	94	9 metres	t
378	95	.05 blood alcohol content	t
381	96	pedestrian crosswalk ahead	t
388	97	right lane ends	t
390	98	deer crossing area ahead	t
396	99	school crosswalk ahead	t
399	100	barricade ahead	t
404	101	no turns allowed	t
405	102	stimulant	f
407	102	tranquilizer	f
408	102	refreshment	f
410	103	left arm positioned outside the window, upward at a 90° angle	f
411	103	left arm positioned outside the window, downward at a 90° angle	f
412	103	right arm positioned straight out to the right	f
413	104	never pass	f
414	104	stop at least 5 metres from the bus (regardless of your direction) and remain stopped until the lights stop flashing	f
415	104	slow down	f
417	105	construction and maintenance signs	f
418	105	regulatory signs	f
416	104	both a and b	t
420	105	warning signs	f
421	106	yellow light	f
423	106	yield sign	f
424	106	caution sign	f
425	107	there is more traffic	f
426	107	you can drive faster at night	f
428	107	both a and c	f
429	108	head-on collisions	f
430	108	side impact collisions	f
432	108	offset collisions	f
433	109	give yourself plenty of time to move over to the lane closest to the exit	f
434	109	signal your intention to leave the expressway, maintain your speed until you are completely in the exit ramp, and then slow down smoothly to whatever speed is posted or to the prevailing speed in the exit ramp	f
435	109	cut over from any lane as soon as you see the exit	f
437	110	brake quickly and firmly	f
439	110	pump the brake	f
440	110	turn on your emergency flashers	f
441	111	a loud noise	f
442	111	excess air pollution	f
444	111	falling vehicle parts	f
445	112	park your vehicle off the roadway and turn off ignitions of vehicles involved in the accident	f
446	112	if you have flares or reflectors, place them 60 metres in front and behind the accident scene	f
447	112	try to assist the people who are involved in the accident. In case of a serious injury, call the police and an ambulance	f
449	113	red, green, yellow	f
450	113	green, yellow, red	f
451	113	green, red, yellow	f
453	114	keep plenty of fresh air in the car	f
454	114	drive a bit faster to reach your destination earlier	f
456	114	drink coffee	f
457	115	intersection ahead	f
458	115	heavy equipment ahead	f
459	115	road ends	f
461	116	do not enter	f
463	116	secondary street	f
464	116	no buses	f
465	117	no parking between 15:30 - 17:00 hrs	f
466	117	emergency stopping only	f
467	117	buses only	f
469	118	do not pass to intersection	f
471	118	for trucks only	f
472	118	stop here during winter months	f
406	102	depressant	t
409	103	left arm positioned straight out of the left window	t
419	105	guide and information signs	t
422	106	stop sign	t
427	107	you cannot see as far	t
431	108	rear end collisions	t
436	109	both a and b	t
438	110	hold your steering wheel firmly, take your foot off the accelerator, reduce your speed, brake gradually and steer to the shoulder	t
443	111	turbulent wind gusts produced by the large vehicle	t
448	112	all of the above	t
452	113	red, yellow, green	t
455	114	stop and rest	t
460	115	trucks entering on the right	t
462	116	truck route	t
468	117	parking is prohibited	t
470	118	stop here for red traffic signal	t
473	119	taking a cold shower	f
474	119	drinking black coffee	f
475	119	eating	f
477	120	through the rear-view mirror	f
478	120	through the right outside mirror	f
480	120	toward the left rear of the vehicle	f
481	121	on curves	f
482	121	approaches to or near the crest of a hill where there is not at least a 150-metre clear view of oncoming traffic	f
483	121	middle of a block	f
485	122	signal well ahead of the turn and, when safe, move into the far-left lane of the street	f
486	122	slow down and begin your left turn after checking for traffic. Turn into the lane closest to the left curb unless blocked within 30 metres of the intersection	f
487	122	unless otherwise indicated, you may turn left from a one-way street to a one-way street on a red light, after stopping and yielding the right-of-way to pedestrians and other traffic	f
489	123	is used only on one way streets	f
491	123	is only to be used by truck traffic	f
492	123	is only used during rush hour periods	f
493	124	under-inflation	f
494	124	cuts and bulges	f
495	124	over-inflation	f
497	125	November 30 to March 1	f
499	125	November 30 to March 31	f
500	125	November 1 to March 1	f
501	126	the heavy truck or bus driver may not be able to see you	f
502	126	the truck or bus blocks your forward visibility	f
503	126	the tires may dislodge stones	f
505	127	has no rights on the highway (roadway) as a bicycle operator	f
506	127	can disregard traffic laws	f
507	127	can only operate during daylight hours	f
509	128	curves ahead	f
510	128	slippery surface	f
512	128	icy conditions	f
514	129	maximum speed 60 km/h	f
515	129	maximum speed 60 km/h during weekends	f
516	129	maximum speed 60 km/h when meeting traffic	f
517	130	speed limit ahead	f
519	130	reduce speed ahead	f
520	130	trucks must reduce speed ahead	f
521	131	no parking	f
523	131	parking allowed	f
524	131	no stopping during rush hour	f
479	120	toward the right rear of the vehicle	t
484	121	all of the above	t
488	122	all of the above	t
496	124	all of the above	t
498	125	November 1 to March 31	t
504	126	all of the above	t
508	127	has the same rights and duties as a driver of a motor vehicle	t
511	128	winding road ahead	t
513	129	maximum speed 60 km/h when passing workers	t
518	130	maximum speed 60 km/h ahead	t
522	131	do not stop to wait	t
525	132	passenger vehicles only	f
526	132	no bicyclists	f
528	132	trucks not allowed	f
476	119	waiting it out	t
490	123	means the same as a green light, but you must go only in the direction the arrow indicates	t
527	132	buses and cyclists only (during designated times)	t
529	133	you turn right only	f
531	133	other vehicles are behind you	f
532	133	you drive in city traffic	f
534	134	correct the defect when you can afford it	f
535	134	drive the vehicle slower	f
536	134	not carry passengers until the defect is corrected	f
537	135	can depend on road signs to help you find your way	f
539	135	only have to know generally where your destination is	f
540	135	should always choose the most direct route	f
541	136	your vehicle is stalled on a highway	f
542	136	your speed is well below the speed limit	f
543	136	performing emergency vehicle maintenance on the road shoulder	f
545	137	have never been licensed for that class of vehicle	f
546	137	have not held a Manitoba licence within the last four years	f
547	137	hold a licence from outside Canada or the United States	f
549	138	no, except on an expressway	f
551	138	yes, if traffic is backed up	f
552	138	yes, any time you need to pass	f
553	139	stop only if there is a stop sign	f
555	139	stop only if traffic is approaching	f
556	139	drive out slowly so as not to hold up traffic behind you	f
557	140	do not enter	f
558	140	no right turn during rush hour	f
560	140	buses may turn right	f
561	141	no right allowed	f
562	141	do not enter	f
563	141	no left turns	f
565	142	pedestrian crosswalk	f
567	142	pedestrian corridor	f
568	142	playground crosswalk	f
530	133	you start, turn, change lanes and move from a straight line	t
533	134	correct the defect as soon as possible	t
538	135	should use a map and plan your trip	t
544	136	all of the above	t
548	137	all of the above	t
550	138	no, it is illegal and dangerous	t
554	139	stop before crossing the sidewalk and yield to pedestrians and vehicles	t
559	140	no right turn	t
564	141	no U-turn allowed	t
566	142	school crosswalk	t
569	143	tranquilizers	f
570	143	antidepressants	f
571	143	sleeping pills and similar drugs	f
573	144	an immediate three-month Administrative Licence Suspension and a driver's licence reinstatement charge	f
574	144	your vehicle will be impounded for 30-180 days, a mandatory Impaired Driver Assessment at your expense and completion of a driver's examination or a driving course at your own expense	f
575	144	a minimum fine of $1000 for a first offence	f
577	145	you should give the vehicle ahead extra room	f
578	145	the driver in the vehicle ahead is creating a danger by being an inattentive driver	f
579	145	you should avoid this bad habit	f
582	146	defends against poor drivers by getting ahead of them in traffic	f
583	146	defends yourself against accidents by being an 'assertive' driver	f
584	146	defends against accidents by driving your vehicle fast enough to stay ahead of traffic congestion	f
585	147	5 years	f
587	147	2 years	f
588	147	1 year	f
590	148	warning signs	f
591	148	information signs	f
592	148	guide signs	f
594	149	report the accident to Manitoba Public Insurance	f
595	149	report the accident to the police	f
596	149	check to see if your vehicle has been damaged	f
597	150	slippery when wet	f
598	150	bridge ahead	f
599	150	broken road surface	f
602	151	buses may turn left	f
603	151	do not enter	f
604	151	slow down for the turn	f
605	152	slow traffic keep right	f
606	152	entering a municipality	f
607	152	prepare to change lanes	f
609	153	one-way traffic	f
610	153	no passing allowed	f
612	153	passing allowed	f
614	154	all trucks must turn right	f
615	154	all buses must turn right	f
616	154	must turn right on Saturday	f
572	143	all of the above	t
576	144	all of the above	t
580	145	all of the above	t
581	146	identifies dangerous driving situations and allows you to take action to avoid an accident before it occurs	t
586	147	3 years	t
589	148	regulatory signs	t
593	149	stop and check to see if anyone is injured	t
600	150	bump ahead	t
601	151	no left turn	t
608	152	keep right of this sign	t
611	153	two-way traffic	t
613	154	traffic must turn right (during designated times)	t
617	155	is good because you miss the rush hour traffic	f
618	155	is good because they help to release the day's tension and make you a safer driver	f
620	155	will never hurt anyone	f
621	156	increases your field of vision	f
623	156	makes it easier to see cross traffic	f
624	156	has no effect on your field of vision	f
625	157	the driver, regardless of who the owner is	f
627	157	the government	f
628	157	the police	f
630	158	environment (the highway and traffic)	f
622	156	decreases your field of vision	t
626	157	the owner of the vehicle	t
629	158	driver (you)	t
631	158	vehicle	f
632	158	time of day	f
633	159	never used as a traffic signal	f
634	159	only used on one-way streets	f
635	159	only to be used by truck traffic	f
637	160	100 km/h	f
639	160	110 km/h	f
640	160	80 km/h	f
641	161	will be refused a licence for five years	f
642	161	are required to submit a character reference	f
644	161	may apply for a licence after 30 days	f
645	162	press hard on the brake	f
646	162	speed up	f
648	162	put your signals on	f
649	163	just before the street	f
650	163	just before the stop sign	f
652	163	one car length or more before the sidewalk (crosswalk)	f
653	164	to the right of and in the second lane from the center line	f
654	164	any lane on your side of the roadway	f
655	164	to the left of the center line so other traffic cannot pass	f
657	165	bridge ahead	f
659	165	narrow road	f
660	165	narrow bridge	f
661	166	two lane traffic	f
663	166	three lane street ahead	f
664	166	right lane ends	f
619	155	will impair your ability to drive	t
636	159	warning that oncoming traffic may next receive a green signal	t
638	160	90 km/h	t
643	161	will be suspended for a year and move down 10 levels on the DSR Scale	t
647	162	gradually slow down	t
651	163	just before the sidewalk (crosswalk)	t
656	164	to the right of and as close to the center line as practical	t
658	165	low structure clearance ahead	t
662	166	passing permitted	t
665	167	two seconds	f
666	167	three seconds	f
668	167	five seconds	f
669	168	30 days	f
670	168	10 days	f
672	168	7 days	f
673	169	left arm positioned outside the window, straight out	f
674	169	left arm positioned outside the window, upward at a 90° angle	f
676	169	right arm positioned straight out to the right	f
678	170	turn right from any lane into a corresponding lane	f
679	170	signal, come to a complete stop and turn right	f
680	170	slow down, turn right	f
681	171	just before you leave on a long trip	f
682	171	only when a defect is noticeable	f
683	171	once a year	f
685	172	stop at the sign and proceed if there is no other traffic	f
686	172	sound your horn to warn traffic that you are merging	f
688	172	slow down to 20 km/h and continue	f
689	173	the lights are not working	f
690	173	the light will turn red soon	f
692	173	stop	f
694	174	increase speed	f
695	174	ignore road conditions	f
696	174	put studded tires on your vehicle	f
697	175	leaving city limits	f
698	175	slippery when wet	f
700	175	municipal road begins	f
701	176	playground ahead	f
703	176	airport ahead	f
704	176	school ahead	f
667	167	four seconds	t
671	168	15 days	t
675	169	left arm positioned outside the left window, downward at a 90° angle	t
677	170	signal, move to the right lane, slow down, scan the intersection for pedestrians and vehicles, recheck mirrors and blind spots, and turn from the right lane nearest the curb into the right lane nearest the curb of the road	t
684	171	twice a year	t
687	172	yield right-of-way to pedestrians and vehicles	t
691	173	prepare to stop and yield the right-of-way to pedestrians	t
693	174	start out slowly and gently test steering and braking conditions	t
699	175	pavement ends	t
702	176	flagperson ahead	t
705	177	under age drivers	f
707	177	older drivers	f
708	177	teenage drivers	f
709	178	drive faster than other traffic	f
710	178	drive at no faster than the maximum posted speed	f
712	178	drive close behind the vehicle ahead	f
713	179	6 months	f
715	179	12 months	f
716	179	15 months	f
718	180	slow down and look for a train. You may proceed if the train is further than 30 metres away	f
719	180	stop 1 metre away from the nearest track	f
720	180	stop 3 metres away from the nearest track	f
721	181	regulatory signs	f
723	181	information signs	f
724	181	guide signs	f
725	182	that the truck may be travelling at a speed slower than the posted speed limit	f
726	182	that you may not be able to pass the truck safely	f
727	182	that you may not be legally allowed to pass the truck	f
729	183	2 metres	f
731	183	10 metres	f
732	183	15 metres	f
734	184	road surface change	f
735	184	leaving a town, city or village	f
736	184	no U-turns allowed	f
737	185	icy road	f
739	185	slippery when wet	f
740	185	check brakes	f
706	177	impaired drivers	t
711	178	slow down and allow for weather conditions	t
714	179	9 months	t
717	180	stop 5 metres away from the nearest track	t
722	181	warning signs	t
728	182	all of the above	t
730	183	5 metres	t
733	184	divided highway ends	t
738	185	bridge ices	t
741	186	is less if you only drink beer	f
742	186	is less if you only drink wine	f
743	186	is greater if you drink whiskey or hard liquor	f
745	187	not pass the vehicle	f
747	187	pass on the right using the paved shoulder	f
748	187	none of the above	f
749	188	curves; hills	f
750	188	churches; schools	f
752	188	freeway on ramps; fire stations	f
753	189	honk your horn	f
754	189	speed up and pass in front of the pedestrians	f
756	189	drive close and frighten the pedestrians so they'll think twice before crossing against a red light	f
758	190	accelerate to complete your right-of-way	f
759	190	speed up	f
760	190	honk your horn and drive though	f
761	191	leave earlier, start out slowly, test your steering and brakes, reduce your speed and increase your following distance	f
762	191	be alert to pedestrians, other vehicles, slippery patches, bridges, blind intersections, slippery intersections, snow plows, graders, etc.	f
763	191	keep windows and windshields clear of ice and snow, and make sure your defroster and windshield wipers are working properly	f
765	192	park all four wheels off the traveled portion of the highway. If you have a standard shift, you can use the starter and low gear to pull your car to the shoulder	f
766	192	use the four-way flasher when your vehicle is coming to a stop, if your vehicle is stalled on a highway or if your speed is well below the speed limit	f
767	192	set up an advance warning by placing reflectors and/or flares some 60 metres in front and behind the car, so that the danger may be seen by approaching drivers. If you cannot move your car off the road, raise the hood to warn other motorists	f
770	193	no parking limitation	f
771	193	no parking before 9:00 a.m.	f
772	193	parking permitted on one-way streets	f
744	186	depends on the amount of alcohol in your blood stream	t
746	187	pass on the left if it is safe and legal	t
751	188	intersections and pedestrian crosswalks	t
755	189	slow down and stop if necessary and let the pedestrians cross safely	t
757	190	slow down and stop	t
764	191	all of the above	t
768	192	all of the above	t
769	193	parking permitted as indicated	t
773	194	two	f
774	194	one	f
776	194	six	f
777	195	your experience	f
778	195	your age	f
780	195	your reaction time	f
781	196	on a curve or a hill because the chance is small that another vehicle is coming	f
782	196	on the gravel shoulder of the highway	f
783	196	when there is a solid white or yellow line on either side of your lane and if it's clear ahead	f
785	197	immediately moving clear of an intersection if you are stopped for a red light or stop sign	f
786	197	driving as closely as possible to the curb or edge of roadway and stopping	f
787	197	remaining stopped at the edge of the road until the emergency vehicles have passed	f
790	198	stop as quickly as you can	f
791	198	speed up to get out of the way	f
792	198	slow down; move as far to the right as possible and stop	f
793	199	Alertness or awareness	f
795	199	Preparedness or responsiveness	f
796	199	The driver signaling an intention to turn right	f
797	200	speed zone	f
798	200	caution	f
799	200	warning	f
802	201	maximum speed 90 km/h for trucks only	f
803	201	maximum speed 90 km/h during weekends	f
804	201	no passing allowed	f
775	194	three	t
779	195	your attitude towards driving	t
784	196	none of the above	t
788	197	all of the above	t
789	198	continue to drive in a normal manner	t
794	199	Drowsiness or fatigue	t
800	200	slow moving vehicle	t
801	201	maximum speed 90 km/h	t
805	202	slippery road conditions	f
806	202	bald or worn tires	f
808	202	too much or too little air in the tires	f
809	203	exit lane	f
810	203	buses must turn right	f
812	203	no right turn	f
807	202	drivers who do not have full control of their vehicles	t
811	203	all traffic must turn right	t
813	204	right side of the front seat	f
814	204	right side of the rear seat	f
816	204	left side of the back seat	f
818	205	yes, only while you are passing a 'group' of cars	f
819	205	only when a vehicle signals from the rear that you are obstructing the passing lane	f
820	205	yes, whenever you are passing a vehicle	f
821	206	enter the intersection anyway	f
822	206	reduce speed, check the traffic and then enter the intersection	f
824	206	enter the intersection as long as you can cross at least half way	f
825	207	ensure that the tires on the vehicle have good tread depth	f
826	207	ensure that the tires on the vehicle are inflated to the proper pressure	f
827	207	reduce vehicle speed when driving in the rain	f
829	208	back up on the shoulder to get onto your exit ramp	f
830	208	turn around on the shoulder and drive on the shoulder to your exit	f
831	208	cut across the grass to your exit	f
833	209	traffic moving in opposite directions cannot change lanes	f
834	209	traffic moving in opposite directions can change lanes	f
835	209	traffic moving in the same direction can change lanes	f
837	210	stop 5 metres away from the nearest track	f
838	210	stop 9 metres away from the nearest track	f
815	204	middle of the back seat	t
817	205	no	t
828	207	all of the above	t
832	208	continue driving to the next exit	t
836	209	traffic moving in the same direction cannot change lanes	t
1048	262	increase to four seconds	f
1049	263	traffic signs	f
840	210	slow down and look for a train. You may proceed if the train is further than 30 metres away.	f
841	211	traffic must turn right	f
843	211	traffic move right	f
844	211	curve in the road	f
823	206	stop before the intersection, wait for traffic to clear, then proceed if safe to do so	t
839	210	stop 15 metres away from the nearest track	t
842	211	very sharp right turn	t
845	212	any vehicle on your left	f
847	212	the driver signaling an intention to turn left	f
848	212	the driver signaling an intention to turn right	f
850	213	large trucks	f
851	213	emergency vehicles	f
852	213	motorcycles	f
853	214	pedestrians must not enter the roadway toward the signal	f
854	214	pedestrians already in the intersection facing the signal may continue to the nearest sidewalk, traffic island or safety zone	f
855	214	pedestrians already in the intersection facing the signal must run to the nearest sidewalk	f
857	215	pass the vehicle on the right	f
858	215	pass the vehicle on the left	f
860	215	honk your horn before passing slowly	f
861	216	slow down and be aware that at your current highway speed you will approach farm machinery sooner than expected	f
862	216	realize it is a piece of farm equipment capable of travelling at only 40 km/h	f
863	216	realize that farm equipment can take up more than ½ of the road	f
865	217	leave your headlights on high beams at all times	f
867	217	dim your lights only if the other driver dims theirs	f
868	217	dim your lights just as you pass the other driver	f
869	218	speed up	f
870	218	slow down	f
872	218	intersection ahead	f
874	219	one-way traffic ahead	f
875	219	two lane roadway	f
876	219	single lane ahead	f
877	220	right turns only	f
878	220	no right turns allowed	f
880	220	left turning lane	f
846	212	the vehicle on your right that has reached the intersection before you	t
849	213	pedestrians	t
856	214	both a and b	t
859	215	not pass the vehicle	t
864	216	all of the above	t
866	217	dim your lights before blinding the other driver	t
871	218	left lane ends ahead	t
873	219	do not pass	t
879	220	through traffic not permitted	t
881	221	when overtaking a vehicle turning left	f
882	221	on one-way streets	f
883	221	on streets with marked lanes	f
885	222	the vehicle on the left	f
886	222	the vehicle signaling a right turn	f
888	222	the vehicle signaling a left turn	f
889	223	scan well ahead of the turn, look for any following vehicles, signal and move close to the centre line	f
890	223	slow down and look both ways before starting to turn. When safe enter the intersection to the right of the directional dividing line and make your turn to the left of the center of the intersection	f
891	223	if turning onto a four-lane highway outside the city, town or village, move to the right after completing the turn, if traffic permits	f
893	224	go	f
895	224	speed up	f
896	224	stop	f
897	225	low overhead clearance	f
898	225	hidden intersection ahead	f
899	225	yield ahead	f
901	226	no right turns on Saturday	f
902	226	right turns allowed at anytime	f
903	226	no stop required for right turn	f
884	221	all of the above	t
887	222	the vehicle on the right	t
892	223	all of the above	t
894	224	yield	t
900	225	hazard marker showing an obstruction	t
904	226	no right turn during the times shown	t
905	227	drive away, all vehicles are similar	f
906	227	don't show your friend that you are unfamiliar with his vehicle	f
907	227	disregard any obvious defects so as not to embarrass your friend	f
909	228	the posted maximum speed limit	f
910	228	a speed that is greater than is reasonable and prudent	f
911	228	a speed that is safe for existing conditions	f
908	227	take a few minutes to familiarize yourself with the operation and location of all the vehicle's equipment	t
912	228	all of the above	t
914	229	only when driving at higher speeds	f
915	229	loosely	f
916	229	only if riding in the front seat	f
917	230	passing is allowed	f
918	230	traffic is moving in the opposite direction	f
919	230	you are in a passing lane	f
922	231	maintain your speed	f
923	231	accelerate and pass the school bus	f
924	231	put your 'hazard lights' on	f
925	232	stop at the stop line before a marked crosswalk	f
926	232	where there is no stop line, stop before the marked crosswalk	f
927	232	if there is no line or marked crosswalk, stop before the sidewalk, out of the way of traffic or pedestrians. If there is no stop line, marked crosswalk or sidewalk, stop before the intersecting roadway	f
913	229	at all times when driving or riding in a vehicle, unless exempted by law	t
920	230	no passing is allowed	t
921	231	reduce your speed and be prepared to stop	t
928	232	all of the above	t
929	233	right	f
931	233	way of life	f
932	233	entitlement	f
933	234	no right turn	f
934	234	trucks only	f
936	234	no right turn between 08:30 - 17:30	f
930	233	privilege	t
935	234	reserved lane located in median lane	t
937	235	check the mirror and blind spot	f
939	235	check blind spots	f
940	235	assume the backing to the right position and look out the rear window	f
941	236	white lane lines separate lanes of traffic moving in the opposite direction	f
943	236	yellow lane lines separate lanes of traffic moving in the same direction	f
944	236	none of the above are true	f
945	237	never	f
946	237	after making proper signals	f
948	237	when your vehicle has come to a complete stop	f
949	238	playground zone	f
950	238	play zone	f
952	238	walk safely	f
954	239	crossing ahead	f
955	239	guarded crossing ahead	f
956	239	cross roads ahead	f
938	235	check oncoming traffic, to the rear, your blind spots, both sides and then turn to the right and look to the rear	t
942	236	white lane lines separate lanes of traffic moving in the same direction	t
947	237	when you are sure that it can be done safely	t
951	238	school zone	t
953	239	railway crossing	t
958	240	6 metres	f
959	240	3 metres	f
960	240	1 metre	f
957	240	9 metres	t
961	241	stay very close	f
963	241	accelerate to pass the vehicle quickly	f
964	241	stay very close to the vehicle while driving on the left side of the road	f
965	242	have been involved in traffic accidents or convictions	f
966	242	have had your licence suspended	f
967	242	suffer from a physical or mental disability that may impair your ability to drive	f
970	243	you may cross these lines to pass other vehicles only if there is no on-coming traffic	f
971	243	you must never cross these lines	f
972	243	you must not cross these lines within 30 metres of the intersection	f
973	244	legal speed limit	f
974	244	condition of vehicle	f
976	244	type of highway	f
977	245	school area ahead	f
978	245	children playing	f
979	245	soccer field ahead	f
962	241	reduce your speed and increase your following distance	t
968	242	all of the above	t
969	243	no passing is allowed, but you may cross these lines to make a left turn into or from an alley, private road or a driveway	t
975	244	speed and existing conditions	t
980	245	playground ahead	t
981	246	slam on your brakes	f
982	246	slam on your brakes so you lock-up all the wheels	f
984	246	pump the brake pedal	f
985	247	only pedestrians may proceed in the direction of the arrow	f
986	247	stop and proceed in the direction of the arrow	f
987	247	wait for the green light before driving in the direction of the arrow	f
983	246	apply hard steady pressure without locking up the wheels (threshold braking)	t
988	247	drive with caution in the direction of the arrow	t
989	248	crossroad ahead	f
991	248	gravel road ahead	f
992	248	right or left turn ahead	f
994	249	slow down	f
995	249	yield ahead	f
996	249	danger ahead	f
990	248	hidden intersection ahead	t
993	249	stop ahead	t
997	250	tap the horn to notify other drivers	f
998	250	turn on the signal closest to the curb	f
1000	250	just pull out of the parking spot	f
1001	251	a double solid line	f
1002	251	a solid line	f
1004	251	a solid and broken line if the solid line is on your side of the highway	f
1005	252	the parking spot is not being used	f
1007	252	it is winter	f
1008	252	it's after 9:30 p.m. and before 9:30 a.m.	f
999	250	turn on the signal furthest from the curb	t
1003	251	a broken line	t
1006	252	you are disabled or you are transporting a disabled person and have a valid disabled parking permit displayed in your vehicle	t
1009	253	delays reaction time	f
1010	253	distorts vision	f
1011	253	impairs judgement	f
1014	254	honk your horn	f
1015	254	slam on your brakes	f
1016	254	assume that the driver will wait till you pass before opening his door	f
1017	255	turned straight ahead	f
1018	255	turned away from the curb	f
1020	255	it doesn't matter in which position	f
1021	256	keep foot off brake and coast to a stop	f
1023	256	brake hard and try to prevent the vehicle from going into a skid	f
1024	256	pump brakes forcefully	f
1012	253	all of the above	t
1013	254	assume that the driver may open the door as you approach	t
1019	255	turned toward the curb	t
1022	256	apply steady pressure without locking up the wheels	t
1025	257	only in city traffic	f
1026	257	if you slow down and no traffic, pedestrian, or sign prohibits such a turn	f
1028	257	at all intersections with traffic lights	f
1029	258	9 metres	f
1030	258	3 metres	f
1031	258	30 metres	f
1033	259	15 per cent	f
1035	259	35 per cent	f
1036	259	5 per cent	f
1037	260	intersection ahead	f
1038	260	hidden intersection ahead	f
1040	260	busy intersection ahead	f
1042	261	hidden intersection	f
1043	261	crossroad ahead	f
1044	261	school bus crossing	f
1027	257	if you stop, and no traffic, pedestrian, or sign prohibits such a turn	t
1032	258	15 metres	t
1034	259	25 per cent	t
1039	260	traffic signals ahead	t
1041	261	angled railway crossing	t
1045	262	remain the same	f
1047	262	decrease	f
1050	263	safe driving practices	f
1051	263	vehicle repairs	f
1053	264	rough road	f
1054	264	slippery when wet	f
1055	264	ice covered	f
1046	262	increase according to the severity of the conditions	t
1052	263	both a and b	t
1056	264	bump ahead	t
1057	265	motor vehicles	f
1058	265	snowmobiles	f
1059	265	dirt bikes and all-terrain vehicles	f
1061	266	any lane as long as you use your signal	f
1062	266	centre lane	f
1064	266	any lane as long as you honk your horn	f
1060	265	all of the above	t
1063	266	lane closest to the left curb	t
1065	267	the tire will last longer	f
1067	267	an increase in road handling	f
1068	267	an increase in gasoline mileage	f
1069	268	brake hard and flash your headlights. If speed can be reduced before the collision, the impact will be less severe	f
1070	268	head for the shoulder on the right-hand side of the road and sound your horn	f
1071	268	drive into the ditch if necessary and head for something that is capable of energy absorption to reduce the force on impact	f
1066	267	the tire could overheat and cause a blowout	t
1072	268	all of the above	t
1073	269	a red flag clearly visible at the end of the load	f
1075	269	a red flag	f
1076	269	a red reflector or light	f
1074	269	a red flag clearly visible at the end of the load and a red light or reflector at night	t
1077	270	an immediate driver's licence suspension	f
1078	270	a driver's licence reinstatement charge	f
1079	270	a mandatory Impaired Driver Assessment if two or more suspensions within a 10-year period	f
1081	271	when visibility is reduced to 60 metres	f
1082	271	one hour before sunset to one hour after sunrise	f
1083	271	½ hour before sunset to ½ hour after sunrise	f
1086	272	turn the wheels straight ahead and set your parking brake	f
1087	272	put the parking brake on only	f
1088	272	turn the wheels away from the curb or edge of the highway and set your parking brake	f
1080	270	all of the above	t
1084	271	both a and c	t
1085	272	turn the wheels toward the curb or edge of the highway and set your parking brake	t
1089	273	the vehicle on the left	f
1091	273	the vehicle with the greatest speed	f
1092	273	the vehicle that enters the intersection first	f
1094	274	60 km/h	f
1095	274	70 km/h	f
1096	274	80 km/h	f
1097	275	lane ends ahead	f
1098	275	two-way traffic ahead	f
1099	275	one-way traffic ahead	f
1090	273	the vehicle on the right	t
1093	274	50 km/h	t
1100	275	traffic island ahead	t
1101	276	slow down as you approach the area	f
1102	276	allow at least twice the following distance behind other vehicles	f
1103	276	know that rain will make the area extremely slippery	f
1105	277	an outside rear-view mirror installed on the driver's side of your vehicle	f
1106	277	an outside rear-view mirror installed on the side of your vehicle opposite the driver	f
1108	277	a person in the vehicle to clear you for right turns	f
1104	276	all of the above	t
1107	277	outside mirrors on the right and left sides	t
1110	278	a rear-facing infant car seat	f
1111	278	a forward-facing child car seat	f
1112	278	a secured seat belt	f
1113	279	take your foot off the accelerator or the brake	f
1114	279	shift to neutral (or depress the clutch)	f
1115	279	look and steer in the direction you would like to go	f
1117	280	playground corridor	f
1119	280	school ground corridor	f
1120	280	school crossing	f
1109	278	a booster seat	t
1116	279	all of the above	t
1118	280	pedestrian corridor	t
1121	281	more rapidly just after eating	f
1123	281	the same way at all times	f
1124	281	only if you have more than two drinks	f
1125	282	never enter the intersection if it is blocked, or if the traffic is backed up in the lane you wish to enter	f
1126	282	enter the intersection to the right of the directional dividing line	f
1127	282	if unable to complete the left turn because of oncoming traffic, establish yourself just before the centre of the intersection and when it is safe, proceed to complete your turn	f
1130	283	wait until the vehicle starts to sink	f
1131	283	wait in the vehicle for emergency assistance	f
1132	283	none of the above	f
1122	281	more rapidly on an empty stomach	t
1128	282	all of the above	t
1129	283	get all the occupants out while the vehicle floats	t
1134	284	used as a guide only	f
1135	284	followed only when there is other traffic	f
1136	284	followed only when a police officer is present	f
1133	284	obeyed always	t
1137	285	pedestrians have the right-of-way at unmarked crosswalks	f
1138	285	pedestrians have the right-of-way at marked crosswalks, which include crosswalks at intersections controlled by traffic lights, school crosswalks and pedestrian crosswalks	f
1139	285	unmarked crosswalks are extensions of sidewalks. No markings or signs are required	f
1141	286	median ahead	f
1142	286	entering a town, city or village	f
1144	286	road ends ahead	f
1140	285	all of the above	t
1143	286	divided highway begins ahead	t
1145	287	flashing red light	f
1146	287	stop sign	f
1148	287	flashing green light	f
1149	288	150 metres	f
1150	288	100 metres	f
1152	288	120 metres	f
1154	289	parking and high beam	f
1155	289	parking lights	f
1156	289	high beam	f
1157	290	all traffic must slow down	f
1158	290	exit lane	f
1160	290	buses may turn left	f
1147	287	yield sign	t
1151	288	60 metres	t
1153	289	low beam	t
1159	290	all traffic must turn left	t
1162	291	let oncoming traffic watch out for themselves	f
1163	291	let the police handle everything	f
1164	291	get off the roadway	f
1161	291	have someone warn approaching traffic	t
1165	292	is alright if you check the rear view mirror	f
1166	292	is a bad driving habit	f
1167	292	may contribute to a collision	f
1168	292	both b and c	t
1169	293	drive close to the vehicle ahead to keep other vehicles from cutting in	f
1170	293	drive close to the vehicle ahead being ready for a sudden stop	f
1172	293	both a and b	f
1173	294	accelerate to make the change	f
1175	294	decelerate and adjust your speed as required	f
1176	294	steer into the lane you wish to change to	f
1177	295	that the roadway ends	f
1178	295	that you must stop for cross traffic	f
1180	295	both b and c	f
1181	296	looking in both inside and outside mirrors	f
1183	296	looking in the right outside mirror	f
1184	296	looking in the left outside mirror	f
1171	293	keep at least a four-second interval between you and the vehicle ahead	t
1174	294	check blind spots and adjust your speed as required	t
1179	295	that you may proceed only with caution	t
1182	296	looking over your shoulder	t
1185	297	give the motorcyclist the right hand part of his traffic lane	f
1187	297	pull to the left just far enough to miss the motorcyclist	f
1188	297	stay one metre away from the motorcycle	f
1189	298	disregard the signal if there are other lanes available for the emergency vehicle	f
1190	298	stop as quickly as you can	f
1192	298	increase your speed to provide a clear path for the emergency vehicle	f
1186	297	give the motorcycle the entire traffic lane as if it were a car	t
1191	298	slow down, move your vehicle to provide a clear path for the emergency vehicle and stop	t
1193	299	at any time	f
1195	299	only on private property	f
1196	299	while stopped and leaving the vehicle for a very short period of time	f
1194	299	only for reasons such as warming a vehicle and defrosting the windshield	t
1197	300	stop	f
1198	300	slow down, stop only if necessary	f
1200	300	speed up and clear the intersection	f
1201	301	350 metres	f
1203	301	150 metres	f
1204	301	200 metres	f
1199	300	stop, wait your turn and go when safe	t
1202	301	450 metres	t
1205	302	move the injured person away from the scene immediately	f
1206	302	always leave the injured person where he or she is	f
1208	302	stay away from the injured person	f
1207	302	do not move the injured person unnecessarily, keep the injured person warm, and administer first aid if possible	t
1209	303	left arm positioned outside the window, straight out	f
1211	303	left arm positioned downward outside, the window at a 90° angle	f
1212	303	right arm positioned out to the right	f
1210	303	left arm positioned outside the left window, upward at a 90° angle	t
1213	304	a speed limit is only in effect if the school grounds are occupied	f
1214	304	the speed limit is 30 km/h in a school zone	f
1216	304	passing is not allowed at any time	f
1215	304	it is illegal to pass another vehicle in a school area, within 15 minutes of either the opening or closing of classes or at any time when children are on the school grounds or near the road	t
1217	305	unnecessarily abuse the vehicle's charging system	f
1218	305	unnecessarily abuse the vehicle's electrical system	f
1220	305	none of the above	f
1219	305	significantly reduce the chances of an accident because your vehicle is easier to see	t
1221	306	are not important	f
1223	306	have no effect on your driving ability	f
1224	306	both a and c	f
1222	306	are very important safety factors	t
1225	307	be aware of developing traffic situations around you	f
1226	307	look well ahead of your vehicle and maintain a proper following distance	f
1227	307	ignore other drivers	f
1229	308	curve in the road	f
1231	308	right turn ahead	f
1232	308	all traffic move right	f
1228	307	both a and b	t
1230	308	right curve ahead	t
1233	309	that the new 60-km/h-speed zone begins at this sign	f
1235	309	that you have plenty of time to slow down before the speed zone	f
1236	309	that the sign is only intended for the local residents	f
1234	309	that the new 60-km/h-speed zone begins at the 'Maximum speed' sign	t
1237	310	drive slowly so approaching vehicles and pedestrians can get out of your way	f
1238	310	honk the horn so approaching vehicles and pedestrians can allow you room	f
1240	310	disregard pedestrians if there is no sidewalk	f
1239	310	stop and yield right-of-way to all pedestrians and traffic	t
\.


--
-- Name: answer_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dr_quiz_db
--

SELECT pg_catalog.setval('answer_id_seq', 1240, true);


--
-- Data for Name: question; Type: TABLE DATA; Schema: public; Owner: dr_quiz_db
--

COPY question (id, question, real_id, signed, sign_name) FROM stdin;
1	When your driver's licence expires you may:	133	f	\N
2	Which of these statements is true regarding the basic steps to pass safely?	154	f	\N
3	A funeral procession with lighted headlights may, if traffic conditions permit and while using caution:	181	f	\N
4	You are driving on a narrow rural road and you are about to meet an oncoming vehicle. You must:	191	f	\N
5	If you see a 'Do Not Pass' sign, it means that:	219	f	\N
6	Studded tires are illegal in Manitoba between:	231	f	\N
7	While driving on a highway, your visibility becomes so poor that you can barely see. You should:	233	f	\N
8	It may be irritating to follow slow-moving vehicles up a hill, but you should know that:	236	f	\N
9	The exit speed shown on the sign is the speed you should:	247	f	\N
10	While driving, your right wheels run off the pavement onto the shoulder of the road. You should first:	250	f	\N
11	Seatbelts must be worn by all drivers and passengers:	275	f	\N
12	When changing lanes you should:	276	f	\N
13	Drivers who are convicted under the criminal code for the first time of driving while impaired by alcohol or drugs will be suspended for a minimum of:	305	f	\N
14	This sign means:	11	t	RoadSign_11.gif
15	This sign means:	16	t	RoadSign_16.gif
16	This sign means:	22	t	RoadSign_22.gif
17	This sign means:	37	t	RoadSign_37.gif
18	This sign means:	40	t	RoadSign_40.gif
19	This sign means:	43	t	RoadSign_43.gif
20	This sign means:	61	t	RoadSign_61.gif
21	Full-time students from outside Manitoba are exempt from vehicle registration but must purchase:	138	f	\N
22	A broken yellow line dividing a two lane roadway means:	160	f	\N
23	On big trucks, there are large blind spots called No-Zones around the truck. Which of the following No-Zones should you avoid?	187	f	\N
24	You are stopped behind a vehicle waiting at a stop sign. When the vehicle leaves the intersection:	197	f	\N
25	A vehicle's tires are required to be replaced when the tread depth is less than:	225	f	\N
26	Pilot vehicles are used to warn drivers they are approaching an oversize vehicle or load. The pilot vehicle must:	237	f	\N
27	Under normal conditions and with properly adjusted low beams, you can see:	239	f	\N
28	To properly negotiate a curve, you should:	242	f	\N
29	To brake in an emergency situation with a vehicle equipped with ABS (antilock) brakes, you should:	253	f	\N
30	If your vehicle comes in contact with electrical wires, you should:	256	f	\N
31	What should you do if another driver attempts to overtake and pass you?	281	f	\N
32	What is considered a safe speed?	282	f	\N
33	Under-inflated tires increase fuel consumption. A single tire under-inflated by 42kpa (6psi) can increase fuel consumption by:	311	f	\N
34	This sign means:	8	t	RoadSign_8.gif
35	This sign means:	13	t	RoadSign_13.gif
36	This sign means:	19	t	RoadSign_19.gif
37	This sign means:	34	t	RoadSign_34.gif
38	This sign means:	36	t	RoadSign_36.gif
39	This sign means:	58	t	RoadSign_58.gif
40	An inattentive driver:	102	f	\N
41	When riding in a vehicle, small children:	114	f	\N
42	Which type of car seat must be used from birth until the infant reaches the maximum weight and height limits stated in the car seat manual?	116	f	\N
43	You are driving on a multi-lane highway at 100 km/h and wish to turn on to another road. You must signal your intentions:	118	f	\N
44	After passing the road test, the intermediate stage driver remains at this level for a minimum of:	129	f	\N
45	Broken yellow lines on a roadway mean:	158	f	\N
46	Broken white lines on a roadway mean:	159	f	\N
47	It is illegal to park:	188	f	\N
48	A police officer directing traffic directs you to go through a red light. What should you do?	220	f	\N
49	If you have driven through standing water deep enough to possibly get your brake shoes wet, you should:	254	f	\N
50	You drive your vehicle into the side of an unattended vehicle and you cannot locate the vehicle's owner. You as a driver:	269	f	\N
51	When approaching a railway crossing you must:	304	f	\N
52	This sign means:	27	t	RoadSign_27.gif
53	If your ability to drive is impaired by alcohol, you should know that:	86	f	\N
54	The seat belt assembly should be adjusted so that it:	113	f	\N
55	You should signal in urban areas (city or town) at least _________ before turning.	123	f	\N
56	Drivers may cross a railway crossing when the crossing signals are flashing if:	164	f	\N
57	To improve the safety and flow of designated vehicles such as transit buses and bicycles, certain traffic lanes have been reserved for their use only. Which statement is true?	166	f	\N
58	You arrive at an intersection with no traffic signs or signals (uncontrolled), the same time as another vehicle. You should:	169	f	\N
59	A vehicle using emergency signals is approaching from the opposite direction on a two-lane street or highway. You should:	179	f	\N
60	Which of the following reversing procedures is correct?	183	f	\N
61	You are stopped at a red light and the light changes to green. You should:	208	f	\N
62	You are approaching a flashing red traffic control signal. You should:	209	f	\N
63	To reduce glare from the lights of an oncoming vehicle, you should:	238	f	\N
64	When a car is stopped at an intersection or crosswalk to allow a pedestrian to cross the street, you should:	270	f	\N
65	This sign means:	39	t	RoadSign_39.gif
66	This sign means:	45	t	RoadSign_45.gif
67	This sign means:	60	t	RoadSign_60.gif
68	This sign means:	66	t	RoadSign_66.gif
69	An aggressive driver:	103	f	\N
70	Information you need to drive safely is gained primarily by:	106	f	\N
71	A Class ______ licence permits the holder to operate a motorcycle.	135	f	\N
209	White solid pavement lines indicate:	307	f	\N
281	Alcoholic beverages will affect you:	82	f	\N
72	When parking a vehicle uphill, vehicles with automatic transmissions should be placed in the 'Park' position, standard transmissions should be placed in low or reverse and the wheels should be:	184	f	\N
73	Under normal conditions and with properly adjusted high beams, you can see:	240	f	\N
74	You wish to enter an expressway. The proper procedure is:	245	f	\N
75	You are involved in an accident. You should:	264	f	\N
76	You are involved in an accident and your vehicle is blocking traffic. You should:	266	f	\N
77	What does a flashing amber (yellow) traffic light mean?	293	f	\N
78	In what lane of traffic should you drive when you are going to make a right turn?	297	f	\N
79	This sign means:	3	t	RoadSign_3.gif
80	This sign means:	47	t	RoadSign_47.gif
81	This sign means:	52	t	RoadSign_52.gif
82	This sign means:	73	t	RoadSign_73.gif
83	This sign means:	76	t	RoadSign_76.gif
84	Persons driving under the influence of intoxicating liquor are:	80	f	\N
85	The police have stopped and asked you to provide an alcohol breath sample. If you refuse you may lose your driver's licence for a minimum of three months:	91	f	\N
86	When you are driving a vehicle, turning your head and looking before changing lanes, driving away from a curb or exiting your vehicle into traffic is:	94	f	\N
87	You are driving on a four-lane highway. A slow moving vehicle is ahead in your lane. Traffic is moderate. Before changing lanes you must:	119	f	\N
88	Following too closely causes many traffic accidents. To avoid these kinds of accidents, the proper interval for following is:	120	f	\N
89	You are passing a car when you notice a 'Hidden Intersection' sign ahead. You should:	149	f	\N
90	A driver encountering a pedestrian who is blind must:	182	f	\N
91	There is a 'reduce speed' sign ahead. As a driver you should know that:	215	f	\N
92	All motor vehicles must be equipped with a mirror, providing a clear view. Vehicles such as vans, buses, trucks, campers, cars pulling trailers must have a:	230	f	\N
93	You must not pass other vehicles in a pedestrian corridor when:	286	f	\N
94	How close to a stop sign can you park?	292	f	\N
95	A person acting as a Class 1-5 supervising driver must be under:	313	f	\N
96	This sign means:	9	t	RoadSign_9.gif
97	This sign means:	17	t	RoadSign_17.gif
98	This sign means:	26	t	RoadSign_26.gif
99	This sign means:	30	t	RoadSign_30.gif
100	This sign means:	44	t	RoadSign_44.gif
101	This sign means:	48	t	RoadSign_48.gif
102	Alcohol is a:	84	f	\N
103	If your vehicle's turn signals don't work and you plan on making a left turn, what is the proper hand signal?	145	f	\N
104	Which of these statements is true regarding a school bus with flashing red lights on an undivided highway. You must:	167	f	\N
105	Certain highway signs and markings contain information about where you are, what road you are on or how to get to certain places. These signs are known as:	194	f	\N
106	A flashing red signal light means the same as a:	204	f	\N
107	One of the main reasons night driving is more dangerous than driving during the day is:	232	f	\N
108	The leading types of collisions at entrances to expressways are:	244	f	\N
109	You wish to exit an expressway. The proper procedure is:	246	f	\N
110	You are driving and a front tire blows out. You should:	249	f	\N
111	When passing a large vehicle, a driver of a small vehicle must be prepared for:	260	f	\N
112	Upon arriving at the scene of an accident, you should	263	f	\N
113	Most traffic lights are arranged from top to bottom in the following order of colors:	288	f	\N
114	If you become very tired while driving you should:	289	f	\N
115	This sign means:	46	t	RoadSign_46.gif
116	This sign means:	54	t	RoadSign_54.gif
117	This sign means:	63	t	RoadSign_63.gif
118	This sign means:	67	t	RoadSign_67.gif
119	After alcohol has entered your blood, you can lessen its effects by:	85	f	\N
120	When changing lanes to the right, you should check your blind spot:	143	f	\N
121	U-turns are prohibited at which of the following locations:	186	f	\N
122	Which of these statements is true regarding making a left turn from a one-way street onto another one-way street?	199	f	\N
123	Lighted arrows are sometimes used to control turns from a specific traffic lane. A green arrow:	203	f	\N
124	Which of the following could affect your tire's performance?	227	f	\N
125	If you cannot otherwise keep your windows clear, frost shields are required in Manitoba from:	229	f	\N
126	When driving directly behind a heavy truck or bus, extra caution must be taken because:	258	f	\N
127	Every person operating a bicycle upon a highway (roadway):	290	f	\N
128	This sign means:	10	t	RoadSign_10.gif
129	This sign means:	38	t	RoadSign_38.gif
130	This sign means:	49	t	RoadSign_49.gif
131	This sign means:	64	t	RoadSign_64.gif
132	This sign means:	71	t	RoadSign_71.gif
133	Your signals must be used when:	96	f	\N
134	You notice a vehicle defect which may make your vehicle unsafe. You should:	109	f	\N
135	When driving to an unfamiliar area, you:	111	f	\N
136	Hazard warning signals (4-way flashers) warn other drivers that a vehicle is in a hazardous position on the roadway. The signal should be used when:	124	f	\N
137	You must take a driver test for the class of vehicle you intend to drive if you:	127	f	\N
138	Is it permitted to pass a vehicle using the gravel shoulder?	152	f	\N
139	When you are driving out of a back lane, driveway or parking lot, you must:	299	f	\N
140	This sign means:	50	t	RoadSign_50.gif
141	This sign means:	56	t	RoadSign_56.gif
142	This sign means:	77	t	RoadSign_77.gif
143	Your ability to drive may also become impaired by which of the following?	87	f	\N
280	This sign means:	75	t	RoadSign_75.gif
144	If your blood alcohol level is over .08 or you refuse to provide a breath or blood sample to police, you may face a variety of consequences. Which of the following consequences is correct?	90	f	\N
145	You are driving behind another vehicle. You notice that the driver is driving with one hand, talking to a passenger. You should know that:	101	f	\N
146	Defensive driving:	104	f	\N
147	In Manitoba, to act as a supervising driver for a new Class 5 driver, a driver must be fully licenced in Class 5 for what period of time?	130	f	\N
148	Certain highway signs and markings require that you must obey the indicated instruction. Such signs are known as:	192	f	\N
149	If you were the driver of a vehicle involved in a collision, what is the FIRST thing you must do?	302	f	\N
150	This sign means:	12	t	RoadSign_12.gif
151	This sign means:	51	t	RoadSign_51.gif
152	This sign means:	59	t	RoadSign_59.gif
153	This sign means:	68	t	RoadSign_68.gif
154	This sign means:	72	t	RoadSign_72.gif
155	A few drinks after work before driving home:	81	f	\N
156	Increasing your vehicle's speed:	107	f	\N
157	Who is responsible for the costs of a vehicle being impounded?	136	f	\N
158	The most important thing in any driving situation is the:	140	f	\N
159	Lighted arrows are sometimes used to control turns from a specific traffic lane. A yellow arrow is:	202	f	\N
160	Unless otherwise posted, the maximum speed limit in rural areas of Manitoba is:	217	f	\N
161	Drivers who are convicted for the first time of driving while impaired by alcohol or drugs:	273	f	\N
162	A vehicle is following you too closely. What should you do?	278	f	\N
163	Where must a vehicle stop at an intersection with a sidewalk (crosswalk) and controlled by a stop sign?	298	f	\N
164	On a two-way street, in what position must your vehicle be before making a left turn?	300	f	\N
165	This sign means:	29	t	RoadSign_29.gif
166	This sign means:	70	t	RoadSign_70.gif
167	Under ideal driving conditions, your following distance should be:	98	f	\N
168	When you change your address, you must notify Manitoba Public Insurance or an Autopac agent within:	131	f	\N
169	If your vehicle's brake lights don't work, what is the proper hand signal when you're stopping?	146	f	\N
170	You are planning to turn right at an intersection of a multi-lane lane street that is controlled by a green traffic light. You should:	207	f	\N
171	Your vehicle should be checked for mechanical defects:	287	f	\N
172	When approaching a yield sign, you must:	294	f	\N
173	What does a flashing amber (yellow) traffic light mean?	306	f	\N
174	If there is ice and snow on the road, you should:	308	f	\N
175	This sign means:	33	t	RoadSign_33.gif
176	This sign means:	41	t	RoadSign_41.gif
177	The most dangerous, unpredictable individuals on our roads who account for about half of all fatalities in Manitoba are:	79	f	\N
178	You are driving and it begins to rain. You should:	121	f	\N
179	Under the GDL program the novice driver must hold a learner's licence for a minimum of __________ months:	134	f	\N
180	You are coming to a railroad crossing in a city or town (urban) and the crossing signals are flashing. You should:	163	f	\N
181	Certain highway signs and markings contain information about hazardous conditions. Such signs are known as:	193	f	\N
182	You are driving up a hill and are approaching a heavy truck from the rear. You should know:	259	f	\N
183	When stopping at a railway crossing in a restricted speed area, always stop at least _____________ away from the nearest track.	274	f	\N
184	This sign means:	15	t	RoadSign_15.gif
185	This sign means:	21	t	RoadSign_21.gif
186	Alcohol's effect on your reflexes and judgement:	92	f	\N
187	You are following a slow moving vehicle on a two-lane road. You may:	150	f	\N
188	Stop lines are solid white lines painted across the traffic lanes indicating the exact place to stop. They can be found in which locations?	195	f	\N
189	You are coming to an intersection and have a green light. Pedestrians are crossing against the red. You should:	206	f	\N
190	You are approaching an amber traffic control signal. You should:	210	f	\N
191	You are responsible for keeping full control of your vehicle at all times, even under dangerous conditions. While driving on icy roads, or in sleet or snow conditions, you should:	235	f	\N
192	If your vehicle stalls or is involved in an accident, move it clear of traffic and try to:	265	f	\N
193	This sign means:	65	t	RoadSign_65.gif
194	If you are taking up residence in Manitoba, you may operate a passenger car and trucks (that have gross weights, including load, not exceeding 3,700 kilograms) for ___________ months before you must register and insure your vehicle here.	137	f	\N
195	Which of the following influences your driving actions most?	139	f	\N
196	You may pass another vehicle:	153	f	\N
197	When an emergency vehicle (ambulance, fire or police), sounding an alarm and flashing its lights, is approaching from any direction, you must yield right of way by:	178	f	\N
198	On a two-lane street your vehicle is being followed by a fire engine that is not using emergency signals. You should:	180	f	\N
199	______________ can be compared to a drugged condition and is often referred to as 'highway hypnosis', which can result in a fatal crash.	241	f	\N
200	This sign means:	5	t	RoadSign_5.gif
201	This sign means:	55	t	RoadSign_55.gif
202	Most automobile accidents involving dangerous road conditions are caused by:	285	f	\N
203	This sign means:	57	t	RoadSign_57.gif
204	The safest area in your vehicle to secure a child seat is the:	117	f	\N
205	When passing another vehicle, are you allowed to exceed the posted speed limit?	151	f	\N
206	The traffic ahead has stopped without leaving you sufficient space to cross the intersection. You should:	201	f	\N
207	Hydroplaning occurs when the vehicle's tires 'ride up' on water on the roadway during heavy rains. To help prevent hydroplaning you should:	221	f	\N
208	You wish to exit the freeway but have missed your exit off ramp. You should:	248	f	\N
210	You are coming to a railroad crossing in a rural area and the crossing signals are flashing. You should:	314	f	\N
211	This sign means:	7	t	RoadSign_7.gif
212	As you approach an intersection, you notice the traffic lights are defective. You must come to a full stop and yield to:	171	f	\N
213	The most vulnerable roadway users are:	174	f	\N
214	Pedestrian signals consist of the lighted words 'WALK' and 'DON'T WALK' and the symbols of a walking person and an orange hand. A steady 'DON'T WALK' or orange hand signal means:	213	f	\N
215	You are driving on a multi-lane street. You notice a vehicle stopped in front of a crosswalk. You should:	214	f	\N
216	When travelling in a rural area, you notice a large farm vehicle ahead of you with flashing lights. You should:	243	f	\N
217	When following or meeting another vehicle at night you should:	309	f	\N
218	This sign means:	18	t	RoadSign_18.gif
219	This sign means:	69	t	RoadSign_69.gif
220	This sign means:	74	t	RoadSign_74.gif
221	Passing on the right is permitted only:	155	f	\N
222	At a 4-way stop intersection, if two vehicles arrive at the same time, which vehicle should be given the right of way?	172	f	\N
223	Which of these statements is true regarding left turns from a two-way onto another two-way street?	198	f	\N
224	This sign means:	4	t	RoadSign_4.gif
225	This sign means:	28	t	RoadSign_28.gif
226	This sign means:	62	t	RoadSign_62.gif
227	You borrow your friend's vehicle, which you've never driven before. You should:	110	f	\N
228	You must not drive your vehicle faster than:	165	f	\N
229	Safety belts are life belts. They should be worn:	112	f	\N
230	A white solid line on a roadway means:	157	f	\N
231	When following a school bus that is approaching a railway crossing, you should:	168	f	\N
232	A stop sign means that you must:	196	f	\N
233	Driving a vehicle in Manitoba is a:	93	f	\N
234	This sign means:	35	t	RoadSign_35.gif
235	You intend to parallel park. Before backing into the spot, you should:	147	f	\N
236	When driving on a four-lane divided highway:	162	f	\N
237	You are allowed to open the door, on the traffic side of your car:	283	f	\N
238	This sign means:	1	t	RoadSign_1.gif
239	This sign means:	6	t	RoadSign_6.gif
240	How close to a stop sign can you park?	312	f	\N
241	When following a vehicle on a dusty gravel road, you should:	100	f	\N
242	You may have to be re-tested if you:	132	f	\N
243	Two solid-yellow lines dividing a highway mean:	161	f	\N
244	The distance you follow behind another vehicle should be determined by:	271	f	\N
245	This sign means:	25	t	RoadSign_25.gif
246	To brake in an emergency situation in a vehicle without ABS (antilock) brakes, you should:	252	f	\N
247	When a green arrow is shown with a red traffic light it means:	291	f	\N
248	This sign means:	20	t	RoadSign_20.gif
249	This sign means:	23	t	RoadSign_23.gif
250	Before starting out from a parked position on a street, the first thing a driver should do is:	141	f	\N
251	Which of the following road markings allow passing on a highway?	156	f	\N
252	It is illegal to park in a space designated for disabled persons unless:	212	f	\N
253	Alcohol is a drug that quickly affects the body. It:	83	f	\N
254	When you approach a vehicle that is parked on your right, you should:	122	f	\N
255	When parking a vehicle downhill, vehicles with automatic transmissions should be placed in the 'Park' position, standard transmissions should be placed in low or reverse and the wheels should be:	185	f	\N
256	You are driving a vehicle without ABS (antilock) brakes on a slippery road, how should you apply the brakes?	295	f	\N
257	You may turn right at a red light:	272	f	\N
258	You are not allowed to park a vehicle within _____________ of a pedestrian corridor.	284	f	\N
259	Frequent rapid acceleration and hard braking increases fuel consumption by up to:	303	f	\N
260	This sign means:	24	t	RoadSign_24.gif
261	This sign means:	31	t	RoadSign_31.gif
262	As weather conditions change, your following distance should:	99	f	\N
263	To receive a learner's licence in Manitoba, you must take a knowledge driver's test that will evaluate your understanding of:	128	f	\N
264	This sign means:	42	t	RoadSign_42.gif
265	Manitoba's tough laws on drinking and driving apply to which of the following:	88	f	\N
266	To turn left from a one-way street, which lane should you turn from?	310	f	\N
267	If you drive your vehicle with an under-inflated tire, what is the most dangerous probable result?	226	f	\N
268	If a vehicle suddenly approaches from the opposite direction in your lane	257	f	\N
269	All vehicles that have a load extending 1.0 metre or more past the rear of the vehicle, must have:	262	f	\N
270	If you operate a vehicle and have a blood alcohol concentration between .05 and .08, you will face a variety of consequences that may include:	89	f	\N
271	When operating your vehicle, headlights must be switched on:	224	f	\N
272	Before leaving your car parked downhill, you should:	280	f	\N
273	You and another vehicle are approaching an intersection that has no traffic signs or signals. Which vehicle has the right of way?	190	f	\N
274	Unless otherwise posted, the maximum speed limit in urban areas (city or town) of Manitoba is:	218	f	\N
275	This sign means:	32	t	RoadSign_32.gif
276	Heavy vehicles have entered the roadway from a muddy area. You should:	126	f	\N
277	When towing a trailer large enough to obstruct your inside rear-view mirror, you are required to have:	261	f	\N
278	Once a child exceeds the height and weight limits for a forward-facing car seat, Manitoba law requires them to be in which type of seat until they are at least 145 cm (4' 9"), 36 kg (80 lb.) or nine years old?	115	f	\N
279	To recover from a skid caused by driving too fast for the conditions, you should:	251	f	\N
282	When intending to make a left turn at an intersection on a green light:	200	f	\N
283	If your vehicle plunges into water, you should:	255	f	\N
284	Traffic signs and pavement markings must be:	148	f	\N
285	Which of the following is true?	173	f	\N
286	This sign means:	14	t	RoadSign_14.gif
287	A flashing yellow signal light means the same as a:	205	f	\N
288	When you are following a vehicle at night, you are required to dim your headlights at a distance of at least:	223	f	\N
289	When driving in a heavy fog or a snowstorm, you should use:	279	f	\N
290	This sign means:	53	t	RoadSign_53.gif
291	When you are involved in an accident where the accident scene is not readily visible to oncoming traffic, you should:	268	f	\N
292	Failing to turn your head to check for traffic before changing lanes:	95	f	\N
293	While driving in rush-hour traffic you should:	97	f	\N
294	Before changing lanes, check your mirrors for traffic, signal your intention to move and:	142	f	\N
295	You are approaching a flashing amber traffic control signal at an intersection. This signal means:	211	f	\N
296	What is the best method to use when checking the blind spot while driving a car?	277	f	\N
297	When passing a motorcycle you must:	125	f	\N
298	You are driving on a divided multi-lane highway when you see or hear the signal of an approaching emergency vehicle. You should:	176	f	\N
299	You may leave a vehicle unattended when the motor is running:	296	f	\N
300	You are approaching an intersection controlled by four-way stop signs. You should:	170	f	\N
301	You are driving at night as an oncoming vehicle approaches. Your headlights must be dimmed at a distance of:	222	f	\N
302	You are involved in an accident and another person is injured. You should:	267	f	\N
303	If your vehicle's turn signals don't work and you plan on making a right turn, what is the proper hand signal?	144	f	\N
304	As you enter a school or playground area, you must drive slowly and be prepared to stop. Which statement is true regarding school zones and playgrounds?	175	f	\N
305	By using your headlights during the daytime, you will:	234	f	\N
306	While driving, your physical and mental conditions:	108	f	\N
307	To drive defensively, you should:	105	f	\N
308	This sign means:	2	t	RoadSign_2.gif
309	While driving you come upon a sign which reads, 'Maximum speed 60 km/h ahead'. You as a driver should know:	216	f	\N
310	When entering a street, Provincial Road or Provincial Trunk Highway from a private road, lane, driveway or building, you should:	189	f	\N
\.


--
-- Name: question_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dr_quiz_db
--

SELECT pg_catalog.setval('question_id_seq', 310, true);


--
-- Name: answer_pkey; Type: CONSTRAINT; Schema: public; Owner: dr_quiz_db; Tablespace: 
--

ALTER TABLE ONLY answer
    ADD CONSTRAINT answer_pkey PRIMARY KEY (id);


--
-- Name: question_pkey; Type: CONSTRAINT; Schema: public; Owner: dr_quiz_db; Tablespace: 
--

ALTER TABLE ONLY question
    ADD CONSTRAINT question_pkey PRIMARY KEY (id);


--
-- Name: question_real_id_key; Type: CONSTRAINT; Schema: public; Owner: dr_quiz_db; Tablespace: 
--

ALTER TABLE ONLY question
    ADD CONSTRAINT question_real_id_key UNIQUE (real_id);


--
-- Name: answer_question_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dr_quiz_db
--

ALTER TABLE ONLY answer
    ADD CONSTRAINT answer_question_id_fkey FOREIGN KEY (question_id) REFERENCES question(id);



--
-- PostgreSQL database dump complete
--

