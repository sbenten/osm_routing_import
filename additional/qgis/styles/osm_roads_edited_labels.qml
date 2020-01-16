<!DOCTYPE qgis PUBLIC 'http://mrcc.com/qgis.dtd' 'SYSTEM'>
<qgis maxScale="0" labelsEnabled="1" minScale="1e+08" styleCategories="AllStyleCategories" simplifyAlgorithm="0" version="3.4.3-Madeira" simplifyDrawingHints="1" simplifyLocal="1" hasScaleBasedVisibilityFlag="0" simplifyMaxScale="1" readOnly="0" simplifyDrawingTol="1">
  <flags>
    <Identifiable>1</Identifiable>
    <Removable>1</Removable>
    <Searchable>1</Searchable>
  </flags>
  <renderer-v2 enableorderby="0" type="RuleRenderer" symbollevels="1" forceraster="0">
    <rules key="{57b0c703-ab34-4333-a1d3-8dab6272a095}">
      <rule label="motorway bridges" filter="highway IN ( 'motorway') AND  &quot;has_bridge&quot; = true" key="{8974c81b-f663-49e4-8ee3-e9a265664b1e}" symbol="0"/>
      <rule label="motorway" filter="highway IN ( 'motorway') " key="{7df0e623-dc67-4cbb-b451-4397f466c1c8}" symbol="1"/>
      <rule label="trunk bridges" filter="highway IN('trunk', 'motorway_link', 'trunk_link') AND  &quot;has_bridge&quot; = true" key="{98a3bdac-bbbd-491b-b420-eb720069289d}" symbol="2"/>
      <rule label="trunk" filter="highway IN ('trunk', 'motorway_link', 'trunk_link')" key="{43a655d2-deb2-4953-a019-f20ac40a3774}" symbol="3"/>
      <rule label="primary bridges" filter="highway IN ('primary','primary_link')  AND  &quot;has_bridge&quot; = true" key="{bcb033d9-9d00-4b86-9922-9a00464ce9c9}" symbol="4"/>
      <rule label="primary " filter="highway IN ('primary','primary_link')" key="{5b8ed0fe-4604-49cd-b845-36f873b8ffdc}" symbol="5"/>
      <rule label="secondary bridges" filter="highway IN ('secondary','secondary_link') AND  &quot;has_bridge&quot; = true" key="{eb3c8293-fadd-48ab-b772-74eb2d0a4e3c}" symbol="6"/>
      <rule label="secondary" filter="highway IN ('secondary','secondary_link')" key="{acd18072-8fd4-4586-a8f9-37f2f9027af8}" symbol="7"/>
      <rule label="tertiary bridges" filter="highway IN ('tertiary', 'tertiary_link') AND  &quot;has_bridge&quot; = true" key="{67d2921d-c5c0-47fd-b2fc-592901cb7118}" symbol="8"/>
      <rule label="tertiary " filter="highway IN ('tertiary', 'tertiary_link')" key="{da324c89-8fe4-499d-918c-03c31ff115fc}" symbol="9"/>
      <rule label="road bridges" scalemaxdenom="1000000" filter="highway IN ( 'road', 'living_street', 'residential', 'unclassified', 'pedestrian')  AND  &quot;has_bridge&quot; = true" key="{de463268-1dcd-4c65-9af0-41d05df617e0}" scalemindenom="50000" symbol="10"/>
      <rule label="road " scalemaxdenom="1000000" filter="highway IN ( 'road', 'living_street', 'residential', 'unclassified', 'pedestrian')" key="{8c55cd70-562f-478f-a3ea-a4983fa7bc73}" scalemindenom="50000" symbol="11"/>
      <rule label="road bridges" scalemaxdenom="50000" filter="highway IN ( 'road', 'living_street', 'residential', 'unclassified', 'pedestrian')  AND  &quot;has_bridge&quot; = true" key="{79437746-bf53-4672-b0d2-e4bc487b8435}" scalemindenom="1" symbol="12"/>
      <rule label="road " scalemaxdenom="50000" filter="highway IN ( 'road', 'living_street', 'residential', 'unclassified', 'pedestrian')" key="{84e42e40-3161-4a51-817b-4db79efb1828}" scalemindenom="1" symbol="13"/>
      <rule label="service roads bridges" scalemaxdenom="25000" filter="highway IN ( 'service')  AND  &quot;has_bridge&quot; = true" key="{6527988f-57b9-4682-be66-a4042317f082}" scalemindenom="1" symbol="14"/>
      <rule label="service roads" scalemaxdenom="25000" filter="highway IN ( 'service')" key="{4055c2f0-9bb8-4533-8df2-81e8ab5cf3d7}" scalemindenom="5" symbol="15"/>
      <rule label="cycleway bridges" scalemaxdenom="25000" filter="highway = 'cycleway'  AND  &quot;has_bridge&quot; = true" key="{3f974e1a-d5eb-480c-919d-c98c2ee76297}" scalemindenom="5" symbol="16"/>
      <rule label="cycleway" scalemaxdenom="25000" filter="highway = 'cycleway'" key="{639293a2-a437-4819-9a7c-50c85daf131c}" scalemindenom="5" symbol="17"/>
      <rule label="track bridges" scalemaxdenom="25000" filter="highway IN ('track') AND  &quot;has_bridge&quot; = true" key="{922eb4a3-8021-43eb-93ef-af72217ada95}" scalemindenom="5" symbol="18"/>
      <rule label="track" scalemaxdenom="25000" filter="highway IN ('track')" key="{81c5dd98-1360-463f-a1f8-7f175316cf83}" scalemindenom="5" symbol="19"/>
      <rule label="path bridges" scalemaxdenom="25000" filter="highway IN ('path', 'footway') AND  &quot;has_bridge&quot; = true" key="{e092fd8f-08ae-4f94-ac46-3a049c8df969}" scalemindenom="5" symbol="20"/>
      <rule label="path" scalemaxdenom="25000" filter="highway IN ('path', 'footway')" key="{ea4cf320-b5ab-463d-8e02-eb998b0ddad3}" scalemindenom="5" symbol="21"/>
      <rule label="train" filter="highway IN ('trainline')" key="{dadd86aa-d815-46f6-84bc-4f8d1b0ef6ee}" symbol="22"/>
      <rule label="tram" filter="highway IN ('tram')" key="{0eefb461-8dea-4f96-874e-6680b28cda1a}" symbol="23"/>
      <rule label="one way" scalemaxdenom="2500" filter="car_oneway = 1 OR  bus_oneway = 1" key="{94758404-1fc1-445e-ad71-3c562850fd38}" scalemindenom="1" symbol="24"/>
      <rule label="steps" scalemaxdenom="25000" filter="highway IN ('steps')" key="{6c9976ae-f34f-437c-87d2-aa43626e6736}" scalemindenom="5" symbol="25"/>
    </rules>
    <symbols>
      <symbol clip_to_extent="1" alpha="1" type="line" force_rhr="0" name="0">
        <layer enabled="1" class="SimpleLine" locked="0" pass="7">
          <prop v="flat" k="capstyle"/>
          <prop v="5;2" k="customdash"/>
          <prop v="3x:0,0,0,0,0,0" k="customdash_map_unit_scale"/>
          <prop v="MapUnit" k="customdash_unit"/>
          <prop v="0" k="draw_inside_polygon"/>
          <prop v="round" k="joinstyle"/>
          <prop v="100,100,100,255" k="line_color"/>
          <prop v="solid" k="line_style"/>
          <prop v="12.3" k="line_width"/>
          <prop v="MapUnit" k="line_width_unit"/>
          <prop v="0" k="offset"/>
          <prop v="3x:0,0,0,0,0,0" k="offset_map_unit_scale"/>
          <prop v="MapUnit" k="offset_unit"/>
          <prop v="0" k="ring_filter"/>
          <prop v="0" k="use_custom_dash"/>
          <prop v="3x:0,0,0,0,0,0" k="width_map_unit_scale"/>
          <data_defined_properties>
            <Option type="Map">
              <Option type="QString" value="" name="name"/>
              <Option type="Map" name="properties">
                <Option type="Map" name="outlineWidth">
                  <Option type="bool" value="true" name="active"/>
                  <Option type="QString" value="max(@map_scale / 1000, 12.3)" name="expression"/>
                  <Option type="int" value="3" name="type"/>
                </Option>
              </Option>
              <Option type="QString" value="collection" name="type"/>
            </Option>
          </data_defined_properties>
        </layer>
        <layer enabled="1" class="SimpleLine" locked="0" pass="8">
          <prop v="round" k="capstyle"/>
          <prop v="5;2" k="customdash"/>
          <prop v="3x:0,0,0,0,0,0" k="customdash_map_unit_scale"/>
          <prop v="MapUnit" k="customdash_unit"/>
          <prop v="0" k="draw_inside_polygon"/>
          <prop v="round" k="joinstyle"/>
          <prop v="232,146,162,255" k="line_color"/>
          <prop v="solid" k="line_style"/>
          <prop v="9" k="line_width"/>
          <prop v="MapUnit" k="line_width_unit"/>
          <prop v="0" k="offset"/>
          <prop v="3x:0,0,0,0,0,0" k="offset_map_unit_scale"/>
          <prop v="MapUnit" k="offset_unit"/>
          <prop v="0" k="ring_filter"/>
          <prop v="0" k="use_custom_dash"/>
          <prop v="3x:0,0,0,0,0,0" k="width_map_unit_scale"/>
          <data_defined_properties>
            <Option type="Map">
              <Option type="QString" value="" name="name"/>
              <Option type="Map" name="properties">
                <Option type="Map" name="outlineWidth">
                  <Option type="bool" value="true" name="active"/>
                  <Option type="QString" value="max(@map_scale / 1100, 9.0)" name="expression"/>
                  <Option type="int" value="3" name="type"/>
                </Option>
              </Option>
              <Option type="QString" value="collection" name="type"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
      <symbol clip_to_extent="1" alpha="1" type="line" force_rhr="0" name="1">
        <layer enabled="1" class="SimpleLine" locked="0" pass="0">
          <prop v="flat" k="capstyle"/>
          <prop v="5;2" k="customdash"/>
          <prop v="3x:0,0,0,0,0,0" k="customdash_map_unit_scale"/>
          <prop v="MapUnit" k="customdash_unit"/>
          <prop v="0" k="draw_inside_polygon"/>
          <prop v="round" k="joinstyle"/>
          <prop v="100,100,100,255" k="line_color"/>
          <prop v="solid" k="line_style"/>
          <prop v="12.3" k="line_width"/>
          <prop v="MapUnit" k="line_width_unit"/>
          <prop v="0" k="offset"/>
          <prop v="3x:0,0,0,0,0,0" k="offset_map_unit_scale"/>
          <prop v="MapUnit" k="offset_unit"/>
          <prop v="0" k="ring_filter"/>
          <prop v="0" k="use_custom_dash"/>
          <prop v="3x:0,0,0,0,0,0" k="width_map_unit_scale"/>
          <data_defined_properties>
            <Option type="Map">
              <Option type="QString" value="" name="name"/>
              <Option type="Map" name="properties">
                <Option type="Map" name="outlineWidth">
                  <Option type="bool" value="true" name="active"/>
                  <Option type="QString" value="max( @map_scale / 1000, 12.3)" name="expression"/>
                  <Option type="int" value="3" name="type"/>
                </Option>
              </Option>
              <Option type="QString" value="collection" name="type"/>
            </Option>
          </data_defined_properties>
        </layer>
        <layer enabled="1" class="SimpleLine" locked="0" pass="6">
          <prop v="flat" k="capstyle"/>
          <prop v="5;2" k="customdash"/>
          <prop v="3x:0,0,0,0,0,0" k="customdash_map_unit_scale"/>
          <prop v="MapUnit" k="customdash_unit"/>
          <prop v="0" k="draw_inside_polygon"/>
          <prop v="round" k="joinstyle"/>
          <prop v="232,146,162,255" k="line_color"/>
          <prop v="solid" k="line_style"/>
          <prop v="9" k="line_width"/>
          <prop v="MapUnit" k="line_width_unit"/>
          <prop v="0" k="offset"/>
          <prop v="3x:0,0,0,0,0,0" k="offset_map_unit_scale"/>
          <prop v="MapUnit" k="offset_unit"/>
          <prop v="0" k="ring_filter"/>
          <prop v="0" k="use_custom_dash"/>
          <prop v="3x:0,0,0,0,0,0" k="width_map_unit_scale"/>
          <data_defined_properties>
            <Option type="Map">
              <Option type="QString" value="" name="name"/>
              <Option type="Map" name="properties">
                <Option type="Map" name="outlineWidth">
                  <Option type="bool" value="true" name="active"/>
                  <Option type="QString" value="max(@map_scale / 1100, 9.0)" name="expression"/>
                  <Option type="int" value="3" name="type"/>
                </Option>
              </Option>
              <Option type="QString" value="collection" name="type"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
      <symbol clip_to_extent="1" alpha="1" type="line" force_rhr="0" name="10">
        <layer enabled="1" class="SimpleLine" locked="1" pass="7">
          <prop v="flat" k="capstyle"/>
          <prop v="5;2" k="customdash"/>
          <prop v="3x:0,0,0,0,0,0" k="customdash_map_unit_scale"/>
          <prop v="MapUnit" k="customdash_unit"/>
          <prop v="0" k="draw_inside_polygon"/>
          <prop v="round" k="joinstyle"/>
          <prop v="207,207,207,255" k="line_color"/>
          <prop v="solid" k="line_style"/>
          <prop v="3.3" k="line_width"/>
          <prop v="MapUnit" k="line_width_unit"/>
          <prop v="0" k="offset"/>
          <prop v="3x:0,0,0,0,0,0" k="offset_map_unit_scale"/>
          <prop v="MapUnit" k="offset_unit"/>
          <prop v="0" k="ring_filter"/>
          <prop v="0" k="use_custom_dash"/>
          <prop v="3x:0,0,0,0,0,0" k="width_map_unit_scale"/>
          <data_defined_properties>
            <Option type="Map">
              <Option type="QString" value="" name="name"/>
              <Option type="Map" name="properties">
                <Option type="Map" name="outlineWidth">
                  <Option type="bool" value="true" name="active"/>
                  <Option type="QString" value="max(@map_scale / 2000, 3.3)" name="expression"/>
                  <Option type="int" value="3" name="type"/>
                </Option>
              </Option>
              <Option type="QString" value="collection" name="type"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
      <symbol clip_to_extent="1" alpha="1" type="line" force_rhr="0" name="11">
        <layer enabled="1" class="SimpleLine" locked="1" pass="0">
          <prop v="flat" k="capstyle"/>
          <prop v="5;2" k="customdash"/>
          <prop v="3x:0,0,0,0,0,0" k="customdash_map_unit_scale"/>
          <prop v="MapUnit" k="customdash_unit"/>
          <prop v="0" k="draw_inside_polygon"/>
          <prop v="round" k="joinstyle"/>
          <prop v="207,207,207,255" k="line_color"/>
          <prop v="solid" k="line_style"/>
          <prop v="3.3" k="line_width"/>
          <prop v="MapUnit" k="line_width_unit"/>
          <prop v="0" k="offset"/>
          <prop v="3x:0,0,0,0,0,0" k="offset_map_unit_scale"/>
          <prop v="MapUnit" k="offset_unit"/>
          <prop v="0" k="ring_filter"/>
          <prop v="0" k="use_custom_dash"/>
          <prop v="3x:0,0,0,0,0,0" k="width_map_unit_scale"/>
          <data_defined_properties>
            <Option type="Map">
              <Option type="QString" value="" name="name"/>
              <Option type="Map" name="properties">
                <Option type="Map" name="outlineWidth">
                  <Option type="bool" value="true" name="active"/>
                  <Option type="QString" value="max(@map_scale / 2000, 3.3)" name="expression"/>
                  <Option type="int" value="3" name="type"/>
                </Option>
              </Option>
              <Option type="QString" value="collection" name="type"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
      <symbol clip_to_extent="1" alpha="1" type="line" force_rhr="0" name="12">
        <layer enabled="1" class="SimpleLine" locked="1" pass="7">
          <prop v="flat" k="capstyle"/>
          <prop v="5;2" k="customdash"/>
          <prop v="3x:0,0,0,0,0,0" k="customdash_map_unit_scale"/>
          <prop v="MapUnit" k="customdash_unit"/>
          <prop v="0" k="draw_inside_polygon"/>
          <prop v="round" k="joinstyle"/>
          <prop v="100,100,100,255" k="line_color"/>
          <prop v="solid" k="line_style"/>
          <prop v="6.6" k="line_width"/>
          <prop v="MapUnit" k="line_width_unit"/>
          <prop v="0" k="offset"/>
          <prop v="3x:0,0,0,0,0,0" k="offset_map_unit_scale"/>
          <prop v="MapUnit" k="offset_unit"/>
          <prop v="0" k="ring_filter"/>
          <prop v="0" k="use_custom_dash"/>
          <prop v="3x:0,0,0,0,0,0" k="width_map_unit_scale"/>
          <data_defined_properties>
            <Option type="Map">
              <Option type="QString" value="" name="name"/>
              <Option name="properties"/>
              <Option type="QString" value="collection" name="type"/>
            </Option>
          </data_defined_properties>
        </layer>
        <layer enabled="1" class="SimpleLine" locked="0" pass="8">
          <prop v="round" k="capstyle"/>
          <prop v="5;2" k="customdash"/>
          <prop v="3x:0,0,0,0,0,0" k="customdash_map_unit_scale"/>
          <prop v="MapUnit" k="customdash_unit"/>
          <prop v="0" k="draw_inside_polygon"/>
          <prop v="round" k="joinstyle"/>
          <prop v="255,255,255,255" k="line_color"/>
          <prop v="solid" k="line_style"/>
          <prop v="5" k="line_width"/>
          <prop v="MapUnit" k="line_width_unit"/>
          <prop v="0" k="offset"/>
          <prop v="3x:0,0,0,0,0,0" k="offset_map_unit_scale"/>
          <prop v="MapUnit" k="offset_unit"/>
          <prop v="0" k="ring_filter"/>
          <prop v="0" k="use_custom_dash"/>
          <prop v="3x:0,0,0,0,0,0" k="width_map_unit_scale"/>
          <data_defined_properties>
            <Option type="Map">
              <Option type="QString" value="" name="name"/>
              <Option type="Map" name="properties">
                <Option type="Map" name="outlineStyle">
                  <Option type="bool" value="false" name="active"/>
                  <Option type="int" value="1" name="type"/>
                  <Option type="QString" value="" name="val"/>
                </Option>
              </Option>
              <Option type="QString" value="collection" name="type"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
      <symbol clip_to_extent="1" alpha="1" type="line" force_rhr="0" name="13">
        <layer enabled="1" class="SimpleLine" locked="1" pass="0">
          <prop v="flat" k="capstyle"/>
          <prop v="5;2" k="customdash"/>
          <prop v="3x:0,0,0,0,0,0" k="customdash_map_unit_scale"/>
          <prop v="MapUnit" k="customdash_unit"/>
          <prop v="0" k="draw_inside_polygon"/>
          <prop v="round" k="joinstyle"/>
          <prop v="100,100,100,255" k="line_color"/>
          <prop v="solid" k="line_style"/>
          <prop v="6.6" k="line_width"/>
          <prop v="MapUnit" k="line_width_unit"/>
          <prop v="0" k="offset"/>
          <prop v="3x:0,0,0,0,0,0" k="offset_map_unit_scale"/>
          <prop v="MapUnit" k="offset_unit"/>
          <prop v="0" k="ring_filter"/>
          <prop v="0" k="use_custom_dash"/>
          <prop v="3x:0,0,0,0,0,0" k="width_map_unit_scale"/>
          <data_defined_properties>
            <Option type="Map">
              <Option type="QString" value="" name="name"/>
              <Option name="properties"/>
              <Option type="QString" value="collection" name="type"/>
            </Option>
          </data_defined_properties>
        </layer>
        <layer enabled="1" class="SimpleLine" locked="0" pass="1">
          <prop v="flat" k="capstyle"/>
          <prop v="5;2" k="customdash"/>
          <prop v="3x:0,0,0,0,0,0" k="customdash_map_unit_scale"/>
          <prop v="MapUnit" k="customdash_unit"/>
          <prop v="0" k="draw_inside_polygon"/>
          <prop v="round" k="joinstyle"/>
          <prop v="255,255,255,255" k="line_color"/>
          <prop v="solid" k="line_style"/>
          <prop v="5" k="line_width"/>
          <prop v="MapUnit" k="line_width_unit"/>
          <prop v="0" k="offset"/>
          <prop v="3x:0,0,0,0,0,0" k="offset_map_unit_scale"/>
          <prop v="MapUnit" k="offset_unit"/>
          <prop v="0" k="ring_filter"/>
          <prop v="0" k="use_custom_dash"/>
          <prop v="3x:0,0,0,0,0,0" k="width_map_unit_scale"/>
          <data_defined_properties>
            <Option type="Map">
              <Option type="QString" value="" name="name"/>
              <Option name="properties"/>
              <Option type="QString" value="collection" name="type"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
      <symbol clip_to_extent="1" alpha="1" type="line" force_rhr="0" name="14">
        <layer enabled="1" class="SimpleLine" locked="1" pass="7">
          <prop v="flat" k="capstyle"/>
          <prop v="5;2" k="customdash"/>
          <prop v="3x:0,0,0,0,0,0" k="customdash_map_unit_scale"/>
          <prop v="MapUnit" k="customdash_unit"/>
          <prop v="0" k="draw_inside_polygon"/>
          <prop v="round" k="joinstyle"/>
          <prop v="171,171,171,255" k="line_color"/>
          <prop v="solid" k="line_style"/>
          <prop v="6.6" k="line_width"/>
          <prop v="MapUnit" k="line_width_unit"/>
          <prop v="0" k="offset"/>
          <prop v="3x:0,0,0,0,0,0" k="offset_map_unit_scale"/>
          <prop v="MapUnit" k="offset_unit"/>
          <prop v="0" k="ring_filter"/>
          <prop v="0" k="use_custom_dash"/>
          <prop v="3x:0,0,0,0,0,0" k="width_map_unit_scale"/>
          <data_defined_properties>
            <Option type="Map">
              <Option type="QString" value="" name="name"/>
              <Option name="properties"/>
              <Option type="QString" value="collection" name="type"/>
            </Option>
          </data_defined_properties>
        </layer>
        <layer enabled="1" class="SimpleLine" locked="0" pass="8">
          <prop v="round" k="capstyle"/>
          <prop v="5;2" k="customdash"/>
          <prop v="3x:0,0,0,0,0,0" k="customdash_map_unit_scale"/>
          <prop v="MapUnit" k="customdash_unit"/>
          <prop v="0" k="draw_inside_polygon"/>
          <prop v="round" k="joinstyle"/>
          <prop v="246,246,246,255" k="line_color"/>
          <prop v="solid" k="line_style"/>
          <prop v="5" k="line_width"/>
          <prop v="MapUnit" k="line_width_unit"/>
          <prop v="0" k="offset"/>
          <prop v="3x:0,0,0,0,0,0" k="offset_map_unit_scale"/>
          <prop v="MapUnit" k="offset_unit"/>
          <prop v="0" k="ring_filter"/>
          <prop v="0" k="use_custom_dash"/>
          <prop v="3x:0,0,0,0,0,0" k="width_map_unit_scale"/>
          <data_defined_properties>
            <Option type="Map">
              <Option type="QString" value="" name="name"/>
              <Option name="properties"/>
              <Option type="QString" value="collection" name="type"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
      <symbol clip_to_extent="1" alpha="1" type="line" force_rhr="0" name="15">
        <layer enabled="1" class="SimpleLine" locked="1" pass="0">
          <prop v="flat" k="capstyle"/>
          <prop v="5;2" k="customdash"/>
          <prop v="3x:0,0,0,0,0,0" k="customdash_map_unit_scale"/>
          <prop v="MapUnit" k="customdash_unit"/>
          <prop v="0" k="draw_inside_polygon"/>
          <prop v="round" k="joinstyle"/>
          <prop v="171,171,171,255" k="line_color"/>
          <prop v="solid" k="line_style"/>
          <prop v="6.6" k="line_width"/>
          <prop v="MapUnit" k="line_width_unit"/>
          <prop v="0" k="offset"/>
          <prop v="3x:0,0,0,0,0,0" k="offset_map_unit_scale"/>
          <prop v="MapUnit" k="offset_unit"/>
          <prop v="0" k="ring_filter"/>
          <prop v="0" k="use_custom_dash"/>
          <prop v="3x:0,0,0,0,0,0" k="width_map_unit_scale"/>
          <data_defined_properties>
            <Option type="Map">
              <Option type="QString" value="" name="name"/>
              <Option name="properties"/>
              <Option type="QString" value="collection" name="type"/>
            </Option>
          </data_defined_properties>
        </layer>
        <layer enabled="1" class="SimpleLine" locked="0" pass="1">
          <prop v="flat" k="capstyle"/>
          <prop v="5;2" k="customdash"/>
          <prop v="3x:0,0,0,0,0,0" k="customdash_map_unit_scale"/>
          <prop v="MapUnit" k="customdash_unit"/>
          <prop v="0" k="draw_inside_polygon"/>
          <prop v="round" k="joinstyle"/>
          <prop v="246,246,246,255" k="line_color"/>
          <prop v="solid" k="line_style"/>
          <prop v="5" k="line_width"/>
          <prop v="MapUnit" k="line_width_unit"/>
          <prop v="0" k="offset"/>
          <prop v="3x:0,0,0,0,0,0" k="offset_map_unit_scale"/>
          <prop v="MapUnit" k="offset_unit"/>
          <prop v="0" k="ring_filter"/>
          <prop v="0" k="use_custom_dash"/>
          <prop v="3x:0,0,0,0,0,0" k="width_map_unit_scale"/>
          <data_defined_properties>
            <Option type="Map">
              <Option type="QString" value="" name="name"/>
              <Option name="properties"/>
              <Option type="QString" value="collection" name="type"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
      <symbol clip_to_extent="1" alpha="1" type="line" force_rhr="0" name="16">
        <layer enabled="1" class="SimpleLine" locked="0" pass="10">
          <prop v="round" k="capstyle"/>
          <prop v="5;2" k="customdash"/>
          <prop v="3x:0,0,0,0,0,0" k="customdash_map_unit_scale"/>
          <prop v="MapUnit" k="customdash_unit"/>
          <prop v="0" k="draw_inside_polygon"/>
          <prop v="round" k="joinstyle"/>
          <prop v="170,85,127,185" k="line_color"/>
          <prop v="dot" k="line_style"/>
          <prop v="2" k="line_width"/>
          <prop v="MapUnit" k="line_width_unit"/>
          <prop v="0" k="offset"/>
          <prop v="3x:0,0,0,0,0,0" k="offset_map_unit_scale"/>
          <prop v="MapUnit" k="offset_unit"/>
          <prop v="0" k="ring_filter"/>
          <prop v="0" k="use_custom_dash"/>
          <prop v="3x:0,0,0,0,0,0" k="width_map_unit_scale"/>
          <data_defined_properties>
            <Option type="Map">
              <Option type="QString" value="" name="name"/>
              <Option name="properties"/>
              <Option type="QString" value="collection" name="type"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
      <symbol clip_to_extent="1" alpha="1" type="line" force_rhr="0" name="17">
        <layer enabled="1" class="SimpleLine" locked="0" pass="9">
          <prop v="round" k="capstyle"/>
          <prop v="5;2" k="customdash"/>
          <prop v="3x:0,0,0,0,0,0" k="customdash_map_unit_scale"/>
          <prop v="MapUnit" k="customdash_unit"/>
          <prop v="0" k="draw_inside_polygon"/>
          <prop v="round" k="joinstyle"/>
          <prop v="170,85,127,185" k="line_color"/>
          <prop v="dot" k="line_style"/>
          <prop v="2" k="line_width"/>
          <prop v="MapUnit" k="line_width_unit"/>
          <prop v="0" k="offset"/>
          <prop v="3x:0,0,0,0,0,0" k="offset_map_unit_scale"/>
          <prop v="MapUnit" k="offset_unit"/>
          <prop v="0" k="ring_filter"/>
          <prop v="0" k="use_custom_dash"/>
          <prop v="3x:0,0,0,0,0,0" k="width_map_unit_scale"/>
          <data_defined_properties>
            <Option type="Map">
              <Option type="QString" value="" name="name"/>
              <Option name="properties"/>
              <Option type="QString" value="collection" name="type"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
      <symbol clip_to_extent="1" alpha="1" type="line" force_rhr="0" name="18">
        <layer enabled="1" class="SimpleLine" locked="0" pass="0">
          <prop v="round" k="capstyle"/>
          <prop v="5;2" k="customdash"/>
          <prop v="3x:0,0,0,0,0,0" k="customdash_map_unit_scale"/>
          <prop v="MapUnit" k="customdash_unit"/>
          <prop v="0" k="draw_inside_polygon"/>
          <prop v="round" k="joinstyle"/>
          <prop v="192,223,255,255" k="line_color"/>
          <prop v="solid" k="line_style"/>
          <prop v="1.86" k="line_width"/>
          <prop v="MapUnit" k="line_width_unit"/>
          <prop v="0" k="offset"/>
          <prop v="3x:0,0,0,0,0,0" k="offset_map_unit_scale"/>
          <prop v="MapUnit" k="offset_unit"/>
          <prop v="0" k="ring_filter"/>
          <prop v="0" k="use_custom_dash"/>
          <prop v="3x:0,0,0,0,0,0" k="width_map_unit_scale"/>
          <data_defined_properties>
            <Option type="Map">
              <Option type="QString" value="" name="name"/>
              <Option name="properties"/>
              <Option type="QString" value="collection" name="type"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
      <symbol clip_to_extent="1" alpha="1" type="line" force_rhr="0" name="19">
        <layer enabled="1" class="SimpleLine" locked="0" pass="0">
          <prop v="flat" k="capstyle"/>
          <prop v="5;2" k="customdash"/>
          <prop v="3x:0,0,0,0,0,0" k="customdash_map_unit_scale"/>
          <prop v="MM" k="customdash_unit"/>
          <prop v="0" k="draw_inside_polygon"/>
          <prop v="round" k="joinstyle"/>
          <prop v="255,255,255,80" k="line_color"/>
          <prop v="solid" k="line_style"/>
          <prop v="4" k="line_width"/>
          <prop v="MapUnit" k="line_width_unit"/>
          <prop v="0" k="offset"/>
          <prop v="3x:0,0,0,0,0,0" k="offset_map_unit_scale"/>
          <prop v="MapUnit" k="offset_unit"/>
          <prop v="0" k="ring_filter"/>
          <prop v="0" k="use_custom_dash"/>
          <prop v="3x:0,0,0,0,0,0" k="width_map_unit_scale"/>
          <data_defined_properties>
            <Option type="Map">
              <Option type="QString" value="" name="name"/>
              <Option name="properties"/>
              <Option type="QString" value="collection" name="type"/>
            </Option>
          </data_defined_properties>
        </layer>
        <layer enabled="1" class="SimpleLine" locked="0" pass="1">
          <prop v="flat" k="capstyle"/>
          <prop v="5;2" k="customdash"/>
          <prop v="3x:0,0,0,0,0,0" k="customdash_map_unit_scale"/>
          <prop v="MapUnit" k="customdash_unit"/>
          <prop v="0" k="draw_inside_polygon"/>
          <prop v="round" k="joinstyle"/>
          <prop v="150,150,150,255" k="line_color"/>
          <prop v="dash" k="line_style"/>
          <prop v="1.5" k="line_width"/>
          <prop v="MapUnit" k="line_width_unit"/>
          <prop v="0" k="offset"/>
          <prop v="3x:0,0,0,0,0,0" k="offset_map_unit_scale"/>
          <prop v="MapUnit" k="offset_unit"/>
          <prop v="0" k="ring_filter"/>
          <prop v="0" k="use_custom_dash"/>
          <prop v="3x:0,0,0,0,0,0" k="width_map_unit_scale"/>
          <data_defined_properties>
            <Option type="Map">
              <Option type="QString" value="" name="name"/>
              <Option name="properties"/>
              <Option type="QString" value="collection" name="type"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
      <symbol clip_to_extent="1" alpha="1" type="line" force_rhr="0" name="2">
        <layer enabled="1" class="SimpleLine" locked="0" pass="7">
          <prop v="flat" k="capstyle"/>
          <prop v="5;2" k="customdash"/>
          <prop v="3x:0,0,0,0,0,0" k="customdash_map_unit_scale"/>
          <prop v="MapUnit" k="customdash_unit"/>
          <prop v="0" k="draw_inside_polygon"/>
          <prop v="round" k="joinstyle"/>
          <prop v="100,100,100,255" k="line_color"/>
          <prop v="solid" k="line_style"/>
          <prop v="10.65" k="line_width"/>
          <prop v="MapUnit" k="line_width_unit"/>
          <prop v="0" k="offset"/>
          <prop v="3x:0,0,0,0,0,0" k="offset_map_unit_scale"/>
          <prop v="MapUnit" k="offset_unit"/>
          <prop v="0" k="ring_filter"/>
          <prop v="0" k="use_custom_dash"/>
          <prop v="3x:0,0,0,0,0,0" k="width_map_unit_scale"/>
          <data_defined_properties>
            <Option type="Map">
              <Option type="QString" value="" name="name"/>
              <Option type="Map" name="properties">
                <Option type="Map" name="outlineWidth">
                  <Option type="bool" value="true" name="active"/>
                  <Option type="QString" value="max(@map_scale / 1000, 10.65)" name="expression"/>
                  <Option type="int" value="3" name="type"/>
                </Option>
              </Option>
              <Option type="QString" value="collection" name="type"/>
            </Option>
          </data_defined_properties>
        </layer>
        <layer enabled="1" class="SimpleLine" locked="0" pass="8">
          <prop v="round" k="capstyle"/>
          <prop v="5;2" k="customdash"/>
          <prop v="3x:0,0,0,0,0,0" k="customdash_map_unit_scale"/>
          <prop v="MapUnit" k="customdash_unit"/>
          <prop v="0" k="draw_inside_polygon"/>
          <prop v="round" k="joinstyle"/>
          <prop v="249,178,156,255" k="line_color"/>
          <prop v="solid" k="line_style"/>
          <prop v="8.25" k="line_width"/>
          <prop v="MapUnit" k="line_width_unit"/>
          <prop v="0" k="offset"/>
          <prop v="3x:0,0,0,0,0,0" k="offset_map_unit_scale"/>
          <prop v="MapUnit" k="offset_unit"/>
          <prop v="0" k="ring_filter"/>
          <prop v="0" k="use_custom_dash"/>
          <prop v="3x:0,0,0,0,0,0" k="width_map_unit_scale"/>
          <data_defined_properties>
            <Option type="Map">
              <Option type="QString" value="" name="name"/>
              <Option type="Map" name="properties">
                <Option type="Map" name="outlineWidth">
                  <Option type="bool" value="true" name="active"/>
                  <Option type="QString" value="max(@map_scale / 1100, 8.25)" name="expression"/>
                  <Option type="int" value="3" name="type"/>
                </Option>
              </Option>
              <Option type="QString" value="collection" name="type"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
      <symbol clip_to_extent="1" alpha="1" type="line" force_rhr="0" name="20">
        <layer enabled="1" class="SimpleLine" locked="0" pass="7">
          <prop v="flat" k="capstyle"/>
          <prop v="5;2" k="customdash"/>
          <prop v="3x:0,0,0,0,0,0" k="customdash_map_unit_scale"/>
          <prop v="MM" k="customdash_unit"/>
          <prop v="0" k="draw_inside_polygon"/>
          <prop v="round" k="joinstyle"/>
          <prop v="255,255,255,80" k="line_color"/>
          <prop v="solid" k="line_style"/>
          <prop v="4" k="line_width"/>
          <prop v="MapUnit" k="line_width_unit"/>
          <prop v="0" k="offset"/>
          <prop v="3x:0,0,0,0,0,0" k="offset_map_unit_scale"/>
          <prop v="MM" k="offset_unit"/>
          <prop v="0" k="ring_filter"/>
          <prop v="0" k="use_custom_dash"/>
          <prop v="3x:0,0,0,0,0,0" k="width_map_unit_scale"/>
          <data_defined_properties>
            <Option type="Map">
              <Option type="QString" value="" name="name"/>
              <Option name="properties"/>
              <Option type="QString" value="collection" name="type"/>
            </Option>
          </data_defined_properties>
        </layer>
        <layer enabled="1" class="SimpleLine" locked="0" pass="8">
          <prop v="flat" k="capstyle"/>
          <prop v="5;2" k="customdash"/>
          <prop v="3x:0,0,0,0,0,0" k="customdash_map_unit_scale"/>
          <prop v="MapUnit" k="customdash_unit"/>
          <prop v="0" k="draw_inside_polygon"/>
          <prop v="round" k="joinstyle"/>
          <prop v="167,168,170,255" k="line_color"/>
          <prop v="dash" k="line_style"/>
          <prop v="1.1" k="line_width"/>
          <prop v="MapUnit" k="line_width_unit"/>
          <prop v="0" k="offset"/>
          <prop v="3x:0,0,0,0,0,0" k="offset_map_unit_scale"/>
          <prop v="MapUnit" k="offset_unit"/>
          <prop v="0" k="ring_filter"/>
          <prop v="0" k="use_custom_dash"/>
          <prop v="3x:0,0,0,0,0,0" k="width_map_unit_scale"/>
          <data_defined_properties>
            <Option type="Map">
              <Option type="QString" value="" name="name"/>
              <Option name="properties"/>
              <Option type="QString" value="collection" name="type"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
      <symbol clip_to_extent="1" alpha="1" type="line" force_rhr="0" name="21">
        <layer enabled="1" class="SimpleLine" locked="0" pass="0">
          <prop v="flat" k="capstyle"/>
          <prop v="5;2" k="customdash"/>
          <prop v="3x:0,0,0,0,0,0" k="customdash_map_unit_scale"/>
          <prop v="MM" k="customdash_unit"/>
          <prop v="0" k="draw_inside_polygon"/>
          <prop v="round" k="joinstyle"/>
          <prop v="255,255,255,80" k="line_color"/>
          <prop v="solid" k="line_style"/>
          <prop v="4" k="line_width"/>
          <prop v="MapUnit" k="line_width_unit"/>
          <prop v="0" k="offset"/>
          <prop v="3x:0,0,0,0,0,0" k="offset_map_unit_scale"/>
          <prop v="MM" k="offset_unit"/>
          <prop v="0" k="ring_filter"/>
          <prop v="0" k="use_custom_dash"/>
          <prop v="3x:0,0,0,0,0,0" k="width_map_unit_scale"/>
          <data_defined_properties>
            <Option type="Map">
              <Option type="QString" value="" name="name"/>
              <Option name="properties"/>
              <Option type="QString" value="collection" name="type"/>
            </Option>
          </data_defined_properties>
        </layer>
        <layer enabled="1" class="SimpleLine" locked="0" pass="1">
          <prop v="flat" k="capstyle"/>
          <prop v="5;2" k="customdash"/>
          <prop v="3x:0,0,0,0,0,0" k="customdash_map_unit_scale"/>
          <prop v="MapUnit" k="customdash_unit"/>
          <prop v="0" k="draw_inside_polygon"/>
          <prop v="round" k="joinstyle"/>
          <prop v="167,168,170,255" k="line_color"/>
          <prop v="dash" k="line_style"/>
          <prop v="1.1" k="line_width"/>
          <prop v="MapUnit" k="line_width_unit"/>
          <prop v="0" k="offset"/>
          <prop v="3x:0,0,0,0,0,0" k="offset_map_unit_scale"/>
          <prop v="MapUnit" k="offset_unit"/>
          <prop v="0" k="ring_filter"/>
          <prop v="0" k="use_custom_dash"/>
          <prop v="3x:0,0,0,0,0,0" k="width_map_unit_scale"/>
          <data_defined_properties>
            <Option type="Map">
              <Option type="QString" value="" name="name"/>
              <Option name="properties"/>
              <Option type="QString" value="collection" name="type"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
      <symbol clip_to_extent="1" alpha="1" type="line" force_rhr="0" name="22">
        <layer enabled="1" class="SimpleLine" locked="0" pass="0">
          <prop v="square" k="capstyle"/>
          <prop v="5;2" k="customdash"/>
          <prop v="3x:0,0,0,0,0,0" k="customdash_map_unit_scale"/>
          <prop v="MM" k="customdash_unit"/>
          <prop v="0" k="draw_inside_polygon"/>
          <prop v="bevel" k="joinstyle"/>
          <prop v="255,255,255,255" k="line_color"/>
          <prop v="solid" k="line_style"/>
          <prop v="6.6" k="line_width"/>
          <prop v="MapUnit" k="line_width_unit"/>
          <prop v="0" k="offset"/>
          <prop v="3x:0,0,0,0,0,0" k="offset_map_unit_scale"/>
          <prop v="MapUnit" k="offset_unit"/>
          <prop v="0" k="ring_filter"/>
          <prop v="0" k="use_custom_dash"/>
          <prop v="3x:0,0,0,0,0,0" k="width_map_unit_scale"/>
          <data_defined_properties>
            <Option type="Map">
              <Option type="QString" value="" name="name"/>
              <Option type="Map" name="properties">
                <Option type="Map" name="outlineWidth">
                  <Option type="bool" value="true" name="active"/>
                  <Option type="QString" value="max(@map_scale / 1500, 6.6)" name="expression"/>
                  <Option type="int" value="3" name="type"/>
                </Option>
              </Option>
              <Option type="QString" value="collection" name="type"/>
            </Option>
          </data_defined_properties>
        </layer>
        <layer enabled="1" class="SimpleLine" locked="0" pass="0">
          <prop v="round" k="capstyle"/>
          <prop v="0.66;2" k="customdash"/>
          <prop v="3x:0,0,0,0,0,0" k="customdash_map_unit_scale"/>
          <prop v="MapUnit" k="customdash_unit"/>
          <prop v="0" k="draw_inside_polygon"/>
          <prop v="round" k="joinstyle"/>
          <prop v="119,122,118,255" k="line_color"/>
          <prop v="dash" k="line_style"/>
          <prop v="6.6" k="line_width"/>
          <prop v="MapUnit" k="line_width_unit"/>
          <prop v="0" k="offset"/>
          <prop v="3x:0,0,0,0,0,0" k="offset_map_unit_scale"/>
          <prop v="MapUnit" k="offset_unit"/>
          <prop v="0" k="ring_filter"/>
          <prop v="0" k="use_custom_dash"/>
          <prop v="3x:0,0,0,0,0,0" k="width_map_unit_scale"/>
          <data_defined_properties>
            <Option type="Map">
              <Option type="QString" value="" name="name"/>
              <Option type="Map" name="properties">
                <Option type="Map" name="outlineWidth">
                  <Option type="bool" value="true" name="active"/>
                  <Option type="QString" value="max(@map_scale / 1500, 6.6)" name="expression"/>
                  <Option type="int" value="3" name="type"/>
                </Option>
              </Option>
              <Option type="QString" value="collection" name="type"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
      <symbol clip_to_extent="1" alpha="1" type="line" force_rhr="0" name="23">
        <layer enabled="1" class="SimpleLine" locked="0" pass="7">
          <prop v="square" k="capstyle"/>
          <prop v="5;2" k="customdash"/>
          <prop v="3x:0,0,0,0,0,0" k="customdash_map_unit_scale"/>
          <prop v="MM" k="customdash_unit"/>
          <prop v="0" k="draw_inside_polygon"/>
          <prop v="bevel" k="joinstyle"/>
          <prop v="0,0,0,255" k="line_color"/>
          <prop v="solid" k="line_style"/>
          <prop v="1.4" k="line_width"/>
          <prop v="MapUnit" k="line_width_unit"/>
          <prop v="0" k="offset"/>
          <prop v="3x:0,0,0,0,0,0" k="offset_map_unit_scale"/>
          <prop v="MM" k="offset_unit"/>
          <prop v="0" k="ring_filter"/>
          <prop v="0" k="use_custom_dash"/>
          <prop v="3x:0,0,0,0,0,0" k="width_map_unit_scale"/>
          <data_defined_properties>
            <Option type="Map">
              <Option type="QString" value="" name="name"/>
              <Option name="properties"/>
              <Option type="QString" value="collection" name="type"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
      <symbol clip_to_extent="1" alpha="1" type="line" force_rhr="0" name="24">
        <layer enabled="1" class="MarkerLine" locked="0" pass="8">
          <prop v="3" k="interval"/>
          <prop v="3x:0,0,0,0,0,0" k="interval_map_unit_scale"/>
          <prop v="MM" k="interval_unit"/>
          <prop v="0" k="offset"/>
          <prop v="0" k="offset_along_line"/>
          <prop v="3x:0,0,0,0,0,0" k="offset_along_line_map_unit_scale"/>
          <prop v="MM" k="offset_along_line_unit"/>
          <prop v="3x:0,0,0,0,0,0" k="offset_map_unit_scale"/>
          <prop v="MM" k="offset_unit"/>
          <prop v="centralpoint" k="placement"/>
          <prop v="0" k="ring_filter"/>
          <prop v="1" k="rotate"/>
          <data_defined_properties>
            <Option type="Map">
              <Option type="QString" value="" name="name"/>
              <Option name="properties"/>
              <Option type="QString" value="collection" name="type"/>
            </Option>
          </data_defined_properties>
          <symbol clip_to_extent="1" alpha="1" type="marker" force_rhr="0" name="@24@0">
            <layer enabled="1" class="SvgMarker" locked="0" pass="0">
              <prop v="90" k="angle"/>
              <prop v="0,0,0,255" k="color"/>
              <prop v="0" k="fixedAspectRatio"/>
              <prop v="1" k="horizontal_anchor_point"/>
              <prop v="arrows/Arrow_06.svg" k="name"/>
              <prop v="0,0" k="offset"/>
              <prop v="3x:0,0,0,0,0,0" k="offset_map_unit_scale"/>
              <prop v="MM" k="offset_unit"/>
              <prop v="255,255,255,255" k="outline_color"/>
              <prop v="0" k="outline_width"/>
              <prop v="3x:0,0,0,0,0,0" k="outline_width_map_unit_scale"/>
              <prop v="MM" k="outline_width_unit"/>
              <prop v="diameter" k="scale_method"/>
              <prop v="7.5" k="size"/>
              <prop v="3x:0,0,0,0,0,0" k="size_map_unit_scale"/>
              <prop v="MapUnit" k="size_unit"/>
              <prop v="1" k="vertical_anchor_point"/>
              <data_defined_properties>
                <Option type="Map">
                  <Option type="QString" value="" name="name"/>
                  <Option name="properties"/>
                  <Option type="QString" value="collection" name="type"/>
                </Option>
              </data_defined_properties>
            </layer>
          </symbol>
        </layer>
      </symbol>
      <symbol clip_to_extent="1" alpha="1" type="line" force_rhr="0" name="25">
        <layer enabled="1" class="SimpleLine" locked="0" pass="0">
          <prop v="flat" k="capstyle"/>
          <prop v="5;2" k="customdash"/>
          <prop v="3x:0,0,0,0,0,0" k="customdash_map_unit_scale"/>
          <prop v="MM" k="customdash_unit"/>
          <prop v="0" k="draw_inside_polygon"/>
          <prop v="round" k="joinstyle"/>
          <prop v="255,255,255,80" k="line_color"/>
          <prop v="solid" k="line_style"/>
          <prop v="4" k="line_width"/>
          <prop v="MapUnit" k="line_width_unit"/>
          <prop v="0" k="offset"/>
          <prop v="3x:0,0,0,0,0,0" k="offset_map_unit_scale"/>
          <prop v="MM" k="offset_unit"/>
          <prop v="0" k="ring_filter"/>
          <prop v="0" k="use_custom_dash"/>
          <prop v="3x:0,0,0,0,0,0" k="width_map_unit_scale"/>
          <data_defined_properties>
            <Option type="Map">
              <Option type="QString" value="" name="name"/>
              <Option name="properties"/>
              <Option type="QString" value="collection" name="type"/>
            </Option>
          </data_defined_properties>
        </layer>
        <layer enabled="1" class="SimpleLine" locked="0" pass="1">
          <prop v="flat" k="capstyle"/>
          <prop v="5;2" k="customdash"/>
          <prop v="3x:0,0,0,0,0,0" k="customdash_map_unit_scale"/>
          <prop v="MapUnit" k="customdash_unit"/>
          <prop v="0" k="draw_inside_polygon"/>
          <prop v="round" k="joinstyle"/>
          <prop v="167,168,170,255" k="line_color"/>
          <prop v="dash" k="line_style"/>
          <prop v="1.1" k="line_width"/>
          <prop v="MapUnit" k="line_width_unit"/>
          <prop v="0" k="offset"/>
          <prop v="3x:0,0,0,0,0,0" k="offset_map_unit_scale"/>
          <prop v="MapUnit" k="offset_unit"/>
          <prop v="0" k="ring_filter"/>
          <prop v="0" k="use_custom_dash"/>
          <prop v="3x:0,0,0,0,0,0" k="width_map_unit_scale"/>
          <data_defined_properties>
            <Option type="Map">
              <Option type="QString" value="" name="name"/>
              <Option name="properties"/>
              <Option type="QString" value="collection" name="type"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
      <symbol clip_to_extent="1" alpha="1" type="line" force_rhr="0" name="3">
        <layer enabled="1" class="SimpleLine" locked="0" pass="0">
          <prop v="flat" k="capstyle"/>
          <prop v="5;2" k="customdash"/>
          <prop v="3x:0,0,0,0,0,0" k="customdash_map_unit_scale"/>
          <prop v="MapUnit" k="customdash_unit"/>
          <prop v="0" k="draw_inside_polygon"/>
          <prop v="round" k="joinstyle"/>
          <prop v="100,100,100,255" k="line_color"/>
          <prop v="solid" k="line_style"/>
          <prop v="10.65" k="line_width"/>
          <prop v="MapUnit" k="line_width_unit"/>
          <prop v="0" k="offset"/>
          <prop v="3x:0,0,0,0,0,0" k="offset_map_unit_scale"/>
          <prop v="MapUnit" k="offset_unit"/>
          <prop v="0" k="ring_filter"/>
          <prop v="0" k="use_custom_dash"/>
          <prop v="3x:0,0,0,0,0,0" k="width_map_unit_scale"/>
          <data_defined_properties>
            <Option type="Map">
              <Option type="QString" value="" name="name"/>
              <Option type="Map" name="properties">
                <Option type="Map" name="outlineWidth">
                  <Option type="bool" value="true" name="active"/>
                  <Option type="QString" value="max(@map_scale / 1000, 10.65)" name="expression"/>
                  <Option type="int" value="3" name="type"/>
                </Option>
              </Option>
              <Option type="QString" value="collection" name="type"/>
            </Option>
          </data_defined_properties>
        </layer>
        <layer enabled="1" class="SimpleLine" locked="0" pass="5">
          <prop v="flat" k="capstyle"/>
          <prop v="5;2" k="customdash"/>
          <prop v="3x:0,0,0,0,0,0" k="customdash_map_unit_scale"/>
          <prop v="MapUnit" k="customdash_unit"/>
          <prop v="0" k="draw_inside_polygon"/>
          <prop v="round" k="joinstyle"/>
          <prop v="249,178,156,255" k="line_color"/>
          <prop v="solid" k="line_style"/>
          <prop v="8.25" k="line_width"/>
          <prop v="MapUnit" k="line_width_unit"/>
          <prop v="0" k="offset"/>
          <prop v="3x:0,0,0,0,0,0" k="offset_map_unit_scale"/>
          <prop v="MapUnit" k="offset_unit"/>
          <prop v="0" k="ring_filter"/>
          <prop v="0" k="use_custom_dash"/>
          <prop v="3x:0,0,0,0,0,0" k="width_map_unit_scale"/>
          <data_defined_properties>
            <Option type="Map">
              <Option type="QString" value="" name="name"/>
              <Option type="Map" name="properties">
                <Option type="Map" name="outlineWidth">
                  <Option type="bool" value="true" name="active"/>
                  <Option type="QString" value="max(@map_scale / 1100, 8.25)" name="expression"/>
                  <Option type="int" value="3" name="type"/>
                </Option>
              </Option>
              <Option type="QString" value="collection" name="type"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
      <symbol clip_to_extent="1" alpha="1" type="line" force_rhr="0" name="4">
        <layer enabled="1" class="SimpleLine" locked="0" pass="7">
          <prop v="flat" k="capstyle"/>
          <prop v="5;2" k="customdash"/>
          <prop v="3x:0,0,0,0,0,0" k="customdash_map_unit_scale"/>
          <prop v="MapUnit" k="customdash_unit"/>
          <prop v="0" k="draw_inside_polygon"/>
          <prop v="round" k="joinstyle"/>
          <prop v="100,100,100,255" k="line_color"/>
          <prop v="solid" k="line_style"/>
          <prop v="10.25" k="line_width"/>
          <prop v="MapUnit" k="line_width_unit"/>
          <prop v="0" k="offset"/>
          <prop v="3x:0,0,0,0,0,0" k="offset_map_unit_scale"/>
          <prop v="MapUnit" k="offset_unit"/>
          <prop v="0" k="ring_filter"/>
          <prop v="0" k="use_custom_dash"/>
          <prop v="3x:0,0,0,0,0,0" k="width_map_unit_scale"/>
          <data_defined_properties>
            <Option type="Map">
              <Option type="QString" value="" name="name"/>
              <Option type="Map" name="properties">
                <Option type="Map" name="outlineWidth">
                  <Option type="bool" value="true" name="active"/>
                  <Option type="QString" value="max(@map_scale / 1000, 10.65)" name="expression"/>
                  <Option type="int" value="3" name="type"/>
                </Option>
              </Option>
              <Option type="QString" value="collection" name="type"/>
            </Option>
          </data_defined_properties>
        </layer>
        <layer enabled="1" class="SimpleLine" locked="0" pass="8">
          <prop v="round" k="capstyle"/>
          <prop v="5;2" k="customdash"/>
          <prop v="3x:0,0,0,0,0,0" k="customdash_map_unit_scale"/>
          <prop v="MapUnit" k="customdash_unit"/>
          <prop v="0" k="draw_inside_polygon"/>
          <prop v="round" k="joinstyle"/>
          <prop v="252,214,164,255" k="line_color"/>
          <prop v="solid" k="line_style"/>
          <prop v="8.65" k="line_width"/>
          <prop v="MapUnit" k="line_width_unit"/>
          <prop v="0" k="offset"/>
          <prop v="3x:0,0,0,0,0,0" k="offset_map_unit_scale"/>
          <prop v="MapUnit" k="offset_unit"/>
          <prop v="0" k="ring_filter"/>
          <prop v="0" k="use_custom_dash"/>
          <prop v="3x:0,0,0,0,0,0" k="width_map_unit_scale"/>
          <data_defined_properties>
            <Option type="Map">
              <Option type="QString" value="" name="name"/>
              <Option type="Map" name="properties">
                <Option type="Map" name="outlineWidth">
                  <Option type="bool" value="true" name="active"/>
                  <Option type="QString" value="max(@map_scale / 1100, 8.25)" name="expression"/>
                  <Option type="int" value="3" name="type"/>
                </Option>
              </Option>
              <Option type="QString" value="collection" name="type"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
      <symbol clip_to_extent="1" alpha="1" type="line" force_rhr="0" name="5">
        <layer enabled="1" class="SimpleLine" locked="0" pass="0">
          <prop v="flat" k="capstyle"/>
          <prop v="5;2" k="customdash"/>
          <prop v="3x:0,0,0,0,0,0" k="customdash_map_unit_scale"/>
          <prop v="MapUnit" k="customdash_unit"/>
          <prop v="0" k="draw_inside_polygon"/>
          <prop v="round" k="joinstyle"/>
          <prop v="100,100,100,255" k="line_color"/>
          <prop v="solid" k="line_style"/>
          <prop v="10.65" k="line_width"/>
          <prop v="MapUnit" k="line_width_unit"/>
          <prop v="0" k="offset"/>
          <prop v="3x:0,0,0,0,0,0" k="offset_map_unit_scale"/>
          <prop v="MapUnit" k="offset_unit"/>
          <prop v="0" k="ring_filter"/>
          <prop v="0" k="use_custom_dash"/>
          <prop v="3x:0,0,0,0,0,0" k="width_map_unit_scale"/>
          <data_defined_properties>
            <Option type="Map">
              <Option type="QString" value="" name="name"/>
              <Option type="Map" name="properties">
                <Option type="Map" name="outlineWidth">
                  <Option type="bool" value="true" name="active"/>
                  <Option type="QString" value="max(@map_scale / 1000, 10.65)" name="expression"/>
                  <Option type="int" value="3" name="type"/>
                </Option>
              </Option>
              <Option type="QString" value="collection" name="type"/>
            </Option>
          </data_defined_properties>
        </layer>
        <layer enabled="1" class="SimpleLine" locked="0" pass="4">
          <prop v="flat" k="capstyle"/>
          <prop v="5;2" k="customdash"/>
          <prop v="3x:0,0,0,0,0,0" k="customdash_map_unit_scale"/>
          <prop v="MapUnit" k="customdash_unit"/>
          <prop v="0" k="draw_inside_polygon"/>
          <prop v="round" k="joinstyle"/>
          <prop v="252,214,164,255" k="line_color"/>
          <prop v="solid" k="line_style"/>
          <prop v="8.25" k="line_width"/>
          <prop v="MapUnit" k="line_width_unit"/>
          <prop v="0" k="offset"/>
          <prop v="3x:0,0,0,0,0,0" k="offset_map_unit_scale"/>
          <prop v="MapUnit" k="offset_unit"/>
          <prop v="0" k="ring_filter"/>
          <prop v="0" k="use_custom_dash"/>
          <prop v="3x:0,0,0,0,0,0" k="width_map_unit_scale"/>
          <data_defined_properties>
            <Option type="Map">
              <Option type="QString" value="" name="name"/>
              <Option type="Map" name="properties">
                <Option type="Map" name="outlineWidth">
                  <Option type="bool" value="true" name="active"/>
                  <Option type="QString" value="max(@map_scale / 1100, 8.25)" name="expression"/>
                  <Option type="int" value="3" name="type"/>
                </Option>
              </Option>
              <Option type="QString" value="collection" name="type"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
      <symbol clip_to_extent="1" alpha="1" type="line" force_rhr="0" name="6">
        <layer enabled="1" class="SimpleLine" locked="0" pass="7">
          <prop v="flat" k="capstyle"/>
          <prop v="5;2" k="customdash"/>
          <prop v="3x:0,0,0,0,0,0" k="customdash_map_unit_scale"/>
          <prop v="MapUnit" k="customdash_unit"/>
          <prop v="0" k="draw_inside_polygon"/>
          <prop v="round" k="joinstyle"/>
          <prop v="100,100,100,255" k="line_color"/>
          <prop v="solid" k="line_style"/>
          <prop v="6.6" k="line_width"/>
          <prop v="MapUnit" k="line_width_unit"/>
          <prop v="0" k="offset"/>
          <prop v="3x:0,0,0,0,0,0" k="offset_map_unit_scale"/>
          <prop v="MapUnit" k="offset_unit"/>
          <prop v="0" k="ring_filter"/>
          <prop v="0" k="use_custom_dash"/>
          <prop v="3x:0,0,0,0,0,0" k="width_map_unit_scale"/>
          <data_defined_properties>
            <Option type="Map">
              <Option type="QString" value="" name="name"/>
              <Option type="Map" name="properties">
                <Option type="Map" name="outlineWidth">
                  <Option type="bool" value="true" name="active"/>
                  <Option type="QString" value="max(@map_scale / 1000, 6.6)" name="expression"/>
                  <Option type="int" value="3" name="type"/>
                </Option>
              </Option>
              <Option type="QString" value="collection" name="type"/>
            </Option>
          </data_defined_properties>
        </layer>
        <layer enabled="1" class="SimpleLine" locked="0" pass="8">
          <prop v="round" k="capstyle"/>
          <prop v="5;2" k="customdash"/>
          <prop v="3x:0,0,0,0,0,0" k="customdash_map_unit_scale"/>
          <prop v="MapUnit" k="customdash_unit"/>
          <prop v="0" k="draw_inside_polygon"/>
          <prop v="round" k="joinstyle"/>
          <prop v="247,250,190,255" k="line_color"/>
          <prop v="solid" k="line_style"/>
          <prop v="5" k="line_width"/>
          <prop v="MapUnit" k="line_width_unit"/>
          <prop v="0" k="offset"/>
          <prop v="3x:0,0,0,0,0,0" k="offset_map_unit_scale"/>
          <prop v="MapUnit" k="offset_unit"/>
          <prop v="0" k="ring_filter"/>
          <prop v="0" k="use_custom_dash"/>
          <prop v="3x:0,0,0,0,0,0" k="width_map_unit_scale"/>
          <data_defined_properties>
            <Option type="Map">
              <Option type="QString" value="" name="name"/>
              <Option type="Map" name="properties">
                <Option type="Map" name="outlineWidth">
                  <Option type="bool" value="true" name="active"/>
                  <Option type="QString" value="max(@map_scale / 1100,  5)" name="expression"/>
                  <Option type="int" value="3" name="type"/>
                </Option>
              </Option>
              <Option type="QString" value="collection" name="type"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
      <symbol clip_to_extent="1" alpha="1" type="line" force_rhr="0" name="7">
        <layer enabled="1" class="SimpleLine" locked="0" pass="0">
          <prop v="flat" k="capstyle"/>
          <prop v="5;2" k="customdash"/>
          <prop v="3x:0,0,0,0,0,0" k="customdash_map_unit_scale"/>
          <prop v="MapUnit" k="customdash_unit"/>
          <prop v="0" k="draw_inside_polygon"/>
          <prop v="round" k="joinstyle"/>
          <prop v="100,100,100,255" k="line_color"/>
          <prop v="solid" k="line_style"/>
          <prop v="6.6" k="line_width"/>
          <prop v="MapUnit" k="line_width_unit"/>
          <prop v="0" k="offset"/>
          <prop v="3x:0,0,0,0,0,0" k="offset_map_unit_scale"/>
          <prop v="MapUnit" k="offset_unit"/>
          <prop v="0" k="ring_filter"/>
          <prop v="0" k="use_custom_dash"/>
          <prop v="3x:0,0,0,0,0,0" k="width_map_unit_scale"/>
          <data_defined_properties>
            <Option type="Map">
              <Option type="QString" value="" name="name"/>
              <Option type="Map" name="properties">
                <Option type="Map" name="outlineWidth">
                  <Option type="bool" value="true" name="active"/>
                  <Option type="QString" value="max(@map_scale / 1000, 6.6)" name="expression"/>
                  <Option type="int" value="3" name="type"/>
                </Option>
              </Option>
              <Option type="QString" value="collection" name="type"/>
            </Option>
          </data_defined_properties>
        </layer>
        <layer enabled="1" class="SimpleLine" locked="0" pass="3">
          <prop v="flat" k="capstyle"/>
          <prop v="5;2" k="customdash"/>
          <prop v="3x:0,0,0,0,0,0" k="customdash_map_unit_scale"/>
          <prop v="MapUnit" k="customdash_unit"/>
          <prop v="0" k="draw_inside_polygon"/>
          <prop v="round" k="joinstyle"/>
          <prop v="247,250,190,255" k="line_color"/>
          <prop v="solid" k="line_style"/>
          <prop v="5" k="line_width"/>
          <prop v="MapUnit" k="line_width_unit"/>
          <prop v="0" k="offset"/>
          <prop v="3x:0,0,0,0,0,0" k="offset_map_unit_scale"/>
          <prop v="MapUnit" k="offset_unit"/>
          <prop v="0" k="ring_filter"/>
          <prop v="0" k="use_custom_dash"/>
          <prop v="3x:0,0,0,0,0,0" k="width_map_unit_scale"/>
          <data_defined_properties>
            <Option type="Map">
              <Option type="QString" value="" name="name"/>
              <Option type="Map" name="properties">
                <Option type="Map" name="outlineWidth">
                  <Option type="bool" value="true" name="active"/>
                  <Option type="QString" value="max(@map_scale / 1100, 5)" name="expression"/>
                  <Option type="int" value="3" name="type"/>
                </Option>
              </Option>
              <Option type="QString" value="collection" name="type"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
      <symbol clip_to_extent="1" alpha="1" type="line" force_rhr="0" name="8">
        <layer enabled="1" class="SimpleLine" locked="0" pass="7">
          <prop v="flat" k="capstyle"/>
          <prop v="5;2" k="customdash"/>
          <prop v="3x:0,0,0,0,0,0" k="customdash_map_unit_scale"/>
          <prop v="MapUnit" k="customdash_unit"/>
          <prop v="0" k="draw_inside_polygon"/>
          <prop v="round" k="joinstyle"/>
          <prop v="100,100,100,255" k="line_color"/>
          <prop v="solid" k="line_style"/>
          <prop v="6.6" k="line_width"/>
          <prop v="MapUnit" k="line_width_unit"/>
          <prop v="0" k="offset"/>
          <prop v="3x:0,0,0,0,0,0" k="offset_map_unit_scale"/>
          <prop v="MapUnit" k="offset_unit"/>
          <prop v="0" k="ring_filter"/>
          <prop v="0" k="use_custom_dash"/>
          <prop v="3x:0,0,0,0,0,0" k="width_map_unit_scale"/>
          <data_defined_properties>
            <Option type="Map">
              <Option type="QString" value="" name="name"/>
              <Option type="Map" name="properties">
                <Option type="Map" name="outlineWidth">
                  <Option type="bool" value="true" name="active"/>
                  <Option type="QString" value="max(@map_scale / 1000, 6.6)" name="expression"/>
                  <Option type="int" value="3" name="type"/>
                </Option>
              </Option>
              <Option type="QString" value="collection" name="type"/>
            </Option>
          </data_defined_properties>
        </layer>
        <layer enabled="1" class="SimpleLine" locked="0" pass="8">
          <prop v="round" k="capstyle"/>
          <prop v="5;2" k="customdash"/>
          <prop v="3x:0,0,0,0,0,0" k="customdash_map_unit_scale"/>
          <prop v="MapUnit" k="customdash_unit"/>
          <prop v="0" k="draw_inside_polygon"/>
          <prop v="round" k="joinstyle"/>
          <prop v="255,255,255,255" k="line_color"/>
          <prop v="solid" k="line_style"/>
          <prop v="5" k="line_width"/>
          <prop v="MapUnit" k="line_width_unit"/>
          <prop v="0" k="offset"/>
          <prop v="3x:0,0,0,0,0,0" k="offset_map_unit_scale"/>
          <prop v="MapUnit" k="offset_unit"/>
          <prop v="0" k="ring_filter"/>
          <prop v="0" k="use_custom_dash"/>
          <prop v="3x:0,0,0,0,0,0" k="width_map_unit_scale"/>
          <data_defined_properties>
            <Option type="Map">
              <Option type="QString" value="" name="name"/>
              <Option type="Map" name="properties">
                <Option type="Map" name="outlineWidth">
                  <Option type="bool" value="true" name="active"/>
                  <Option type="QString" value="max(@map_scale / 1100, 5)" name="expression"/>
                  <Option type="int" value="3" name="type"/>
                </Option>
              </Option>
              <Option type="QString" value="collection" name="type"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
      <symbol clip_to_extent="1" alpha="1" type="line" force_rhr="0" name="9">
        <layer enabled="1" class="SimpleLine" locked="0" pass="0">
          <prop v="flat" k="capstyle"/>
          <prop v="5;2" k="customdash"/>
          <prop v="3x:0,0,0,0,0,0" k="customdash_map_unit_scale"/>
          <prop v="MapUnit" k="customdash_unit"/>
          <prop v="0" k="draw_inside_polygon"/>
          <prop v="round" k="joinstyle"/>
          <prop v="100,100,100,255" k="line_color"/>
          <prop v="solid" k="line_style"/>
          <prop v="6.6" k="line_width"/>
          <prop v="MapUnit" k="line_width_unit"/>
          <prop v="0" k="offset"/>
          <prop v="3x:0,0,0,0,0,0" k="offset_map_unit_scale"/>
          <prop v="MapUnit" k="offset_unit"/>
          <prop v="0" k="ring_filter"/>
          <prop v="0" k="use_custom_dash"/>
          <prop v="3x:0,0,0,0,0,0" k="width_map_unit_scale"/>
          <data_defined_properties>
            <Option type="Map">
              <Option type="QString" value="" name="name"/>
              <Option type="Map" name="properties">
                <Option type="Map" name="outlineWidth">
                  <Option type="bool" value="true" name="active"/>
                  <Option type="QString" value="max(@map_scale / 1000, 6.6)" name="expression"/>
                  <Option type="int" value="3" name="type"/>
                </Option>
              </Option>
              <Option type="QString" value="collection" name="type"/>
            </Option>
          </data_defined_properties>
        </layer>
        <layer enabled="1" class="SimpleLine" locked="0" pass="2">
          <prop v="flat" k="capstyle"/>
          <prop v="5;2" k="customdash"/>
          <prop v="3x:0,0,0,0,0,0" k="customdash_map_unit_scale"/>
          <prop v="MapUnit" k="customdash_unit"/>
          <prop v="0" k="draw_inside_polygon"/>
          <prop v="round" k="joinstyle"/>
          <prop v="255,255,255,255" k="line_color"/>
          <prop v="solid" k="line_style"/>
          <prop v="5" k="line_width"/>
          <prop v="MapUnit" k="line_width_unit"/>
          <prop v="0" k="offset"/>
          <prop v="3x:0,0,0,0,0,0" k="offset_map_unit_scale"/>
          <prop v="MapUnit" k="offset_unit"/>
          <prop v="0" k="ring_filter"/>
          <prop v="0" k="use_custom_dash"/>
          <prop v="3x:0,0,0,0,0,0" k="width_map_unit_scale"/>
          <data_defined_properties>
            <Option type="Map">
              <Option type="QString" value="" name="name"/>
              <Option type="Map" name="properties">
                <Option type="Map" name="outlineWidth">
                  <Option type="bool" value="true" name="active"/>
                  <Option type="QString" value="max(@map_scale / 1100, 5)" name="expression"/>
                  <Option type="int" value="3" name="type"/>
                </Option>
              </Option>
              <Option type="QString" value="collection" name="type"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
    </symbols>
  </renderer-v2>
  <labeling type="simple">
    <settings>
      <text-style fieldName="name" textOpacity="1" fontSizeMapUnitScale="3x:0,0,0,0,0,0" fontUnderline="0" textColor="68,68,68,255" namedStyle="Italic" fontFamily="Calibri" fontItalic="1" previewBkgrdColor="#ffffff" fontLetterSpacing="0.796875" fontCapitals="0" fontSizeUnit="MapUnit" useSubstitutions="0" fontStrikeout="0" fontSize="11.5" blendMode="0" fontWordSpacing="0" multilineHeight="1" fontWeight="50" isExpression="0">
        <text-buffer bufferDraw="1" bufferBlendMode="0" bufferSizeUnits="MapUnit" bufferJoinStyle="128" bufferSize="4" bufferColor="255,255,255,255" bufferSizeMapUnitScale="3x:0,0,0,0,0,0" bufferNoFill="0" bufferOpacity="0.75"/>
        <background shapeOpacity="1" shapeSizeX="0" shapeRadiiUnit="MM" shapeType="0" shapeBlendMode="0" shapeRotation="0" shapeSizeY="0" shapeOffsetMapUnitScale="3x:0,0,0,0,0,0" shapeOffsetUnit="MM" shapeOffsetX="0" shapeSizeUnit="MM" shapeBorderWidthUnit="MM" shapeRadiiY="0" shapeFillColor="255,255,255,255" shapeDraw="0" shapeOffsetY="0" shapeSizeType="0" shapeSVGFile="" shapeBorderWidth="0" shapeSizeMapUnitScale="3x:0,0,0,0,0,0" shapeBorderWidthMapUnitScale="3x:0,0,0,0,0,0" shapeRadiiX="0" shapeJoinStyle="64" shapeBorderColor="128,128,128,255" shapeRotationType="0" shapeRadiiMapUnitScale="3x:0,0,0,0,0,0"/>
        <shadow shadowUnder="0" shadowOffsetAngle="135" shadowBlendMode="6" shadowRadiusAlphaOnly="0" shadowOffsetMapUnitScale="3x:0,0,0,0,0,0" shadowRadiusUnit="MM" shadowRadius="1.5" shadowColor="0,0,0,255" shadowOpacity="0.7" shadowOffsetDist="1" shadowOffsetUnit="MM" shadowRadiusMapUnitScale="3x:0,0,0,0,0,0" shadowScale="100" shadowOffsetGlobal="1" shadowDraw="0"/>
        <substitutions/>
      </text-style>
      <text-format multilineAlign="0" reverseDirectionSymbol="0" plussign="0" wrapChar="" rightDirectionSymbol=">" leftDirectionSymbol="&lt;" decimals="0" useMaxLineLengthForAutoWrap="1" formatNumbers="0" addDirectionSymbol="0" autoWrapLength="0" placeDirectionSymbol="0"/>
      <placement dist="0" distUnits="MM" centroidWhole="0" labelOffsetMapUnitScale="3x:0,0,0,0,0,0" repeatDistance="0" offsetUnits="MapUnit" maxCurvedCharAngleOut="-20" yOffset="0" offsetType="0" xOffset="0" repeatDistanceMapUnitScale="3x:0,0,0,0,0,0" preserveRotation="1" priority="4" repeatDistanceUnits="MM" placementFlags="9" centroidInside="0" placement="3" distMapUnitScale="3x:0,0,0,0,0,0" maxCurvedCharAngleIn="20" predefinedPositionOrder="TR,TL,BR,BL,R,L,TSR,BSR" quadOffset="4" rotationAngle="0" fitInPolygonOnly="0"/>
      <rendering fontMaxPixelSize="10000" drawLabels="1" scaleMin="1" obstacleType="0" scaleVisibility="1" scaleMax="5000" minFeatureSize="3" labelPerPart="0" fontMinPixelSize="3" zIndex="0" upsidedownLabels="0" mergeLines="1" fontLimitPixelSize="0" obstacle="1" displayAll="0" limitNumLabels="0" obstacleFactor="1" maxNumLabels="2000"/>
      <dd_properties>
        <Option type="Map">
          <Option type="QString" value="" name="name"/>
          <Option type="Map" name="properties">
            <Option type="Map" name="Size">
              <Option type="bool" value="true" name="active"/>
              <Option type="QString" value="max(@map_scale / 1000, 11.5)" name="expression"/>
              <Option type="int" value="3" name="type"/>
            </Option>
          </Option>
          <Option type="QString" value="collection" name="type"/>
        </Option>
      </dd_properties>
    </settings>
  </labeling>
  <customproperties>
    <property key="embeddedWidgets/count" value="0"/>
    <property key="variableNames"/>
    <property key="variableValues"/>
  </customproperties>
  <blendMode>0</blendMode>
  <featureBlendMode>0</featureBlendMode>
  <layerOpacity>1</layerOpacity>
  <SingleCategoryDiagramRenderer diagramType="Histogram" attributeLegend="1">
    <DiagramCategory sizeScale="3x:0,0,0,0,0,0" minimumSize="0" scaleBasedVisibility="0" lineSizeType="MM" backgroundColor="#ffffff" height="15" backgroundAlpha="255" rotationOffset="270" diagramOrientation="Up" penWidth="0" minScaleDenominator="0" sizeType="MM" maxScaleDenominator="1e+08" barWidth="5" width="15" scaleDependency="Area" labelPlacementMethod="XHeight" opacity="1" enabled="0" penAlpha="255" lineSizeScale="3x:0,0,0,0,0,0" penColor="#000000">
      <fontProperties description="MS Shell Dlg 2,9.6,-1,5,50,0,0,0,0,0" style=""/>
      <attribute label="" field="" color="#000000"/>
    </DiagramCategory>
  </SingleCategoryDiagramRenderer>
  <DiagramLayerSettings placement="2" dist="0" zIndex="0" showAll="1" linePlacementFlags="18" obstacle="0" priority="0">
    <properties>
      <Option type="Map">
        <Option type="QString" value="" name="name"/>
        <Option name="properties"/>
        <Option type="QString" value="collection" name="type"/>
      </Option>
    </properties>
  </DiagramLayerSettings>
  <geometryOptions removeDuplicateNodes="0" geometryPrecision="0">
    <activeChecks/>
    <checkConfiguration/>
  </geometryOptions>
  <fieldConfiguration>
    <field name="id">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="ways_id">
      <editWidget type="Range">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="osm_id">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="name">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="highway">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="z_order">
      <editWidget type="Range">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="attrs">
      <editWidget type="KeyValue">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="source">
      <editWidget type="Range">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="target">
      <editWidget type="Range">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="length_m">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="built_up">
      <editWidget type="CheckBox">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="has_bridge">
      <editWidget type="CheckBox">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="has_tunnel">
      <editWidget type="CheckBox">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="has_parking">
      <editWidget type="CheckBox">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="curve_index">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="terrain_index">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="car_cost">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="car_reverse_cost">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="bus_cost">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="bus_reverse_cost">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="tram_cost">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="tram_reverse_cost">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="cycle_cost">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="cycle_reverse_cost">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="walk_cost">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="walk_reverse_cost">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="car_cost_time">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="car_reverse_cost_time">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="bus_cost_time">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="bus_reverse_cost_time">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="tram_cost_time">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="tram_reverse_cost_time">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="cycle_cost_time">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="cycle_reverse_cost_time">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="walk_cost_time">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="walk_reverse_cost_time">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="car_cost_met">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="car_reverse_cost_met">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="bus_cost_met">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="bus_reverse_cost_met">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="tram_cost_met">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="tram_reverse_cost_met">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="cycle_cost_met">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="cycle_reverse_cost_met">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="walk_cost_met">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="walk_reverse_cost_met">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="car_speed">
      <editWidget type="Range">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="bus_speed">
      <editWidget type="Range">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="tram_speed">
      <editWidget type="Range">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="cycle_speed">
      <editWidget type="Range">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="walk_speed">
      <editWidget type="Range">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="car_allow">
      <editWidget type="CheckBox">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="bus_allow">
      <editWidget type="CheckBox">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="cycle_allow">
      <editWidget type="CheckBox">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="walk_allow">
      <editWidget type="CheckBox">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="tram_allow">
      <editWidget type="CheckBox">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="park_allow">
      <editWidget type="CheckBox">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="car_oneway">
      <editWidget type="Range">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="bus_oneway">
      <editWidget type="Range">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="tram_oneway">
      <editWidget type="Range">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="cycle_oneway">
      <editWidget type="Range">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="walk_oneway">
      <editWidget type="Range">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="startaltitude">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="endaltitude">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="percentslope">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="reversepercentslope">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="angleslope">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="reverseangleslope">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="totalascent">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="totaldescent">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="train_cost">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="train_reverse_cost">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="train_cost_time">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="train_reverse_cost_time">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="train_cost_met">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="train_reverse_cost_met">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="train_allow">
      <editWidget type="CheckBox">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="train_oneway">
      <editWidget type="Range">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="train_speed">
      <editWidget type="Range">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
  </fieldConfiguration>
  <aliases>
    <alias field="id" index="0" name=""/>
    <alias field="ways_id" index="1" name=""/>
    <alias field="osm_id" index="2" name=""/>
    <alias field="name" index="3" name=""/>
    <alias field="highway" index="4" name=""/>
    <alias field="z_order" index="5" name=""/>
    <alias field="attrs" index="6" name=""/>
    <alias field="source" index="7" name=""/>
    <alias field="target" index="8" name=""/>
    <alias field="length_m" index="9" name=""/>
    <alias field="built_up" index="10" name=""/>
    <alias field="has_bridge" index="11" name=""/>
    <alias field="has_tunnel" index="12" name=""/>
    <alias field="has_parking" index="13" name=""/>
    <alias field="curve_index" index="14" name=""/>
    <alias field="terrain_index" index="15" name=""/>
    <alias field="car_cost" index="16" name=""/>
    <alias field="car_reverse_cost" index="17" name=""/>
    <alias field="bus_cost" index="18" name=""/>
    <alias field="bus_reverse_cost" index="19" name=""/>
    <alias field="tram_cost" index="20" name=""/>
    <alias field="tram_reverse_cost" index="21" name=""/>
    <alias field="cycle_cost" index="22" name=""/>
    <alias field="cycle_reverse_cost" index="23" name=""/>
    <alias field="walk_cost" index="24" name=""/>
    <alias field="walk_reverse_cost" index="25" name=""/>
    <alias field="car_cost_time" index="26" name=""/>
    <alias field="car_reverse_cost_time" index="27" name=""/>
    <alias field="bus_cost_time" index="28" name=""/>
    <alias field="bus_reverse_cost_time" index="29" name=""/>
    <alias field="tram_cost_time" index="30" name=""/>
    <alias field="tram_reverse_cost_time" index="31" name=""/>
    <alias field="cycle_cost_time" index="32" name=""/>
    <alias field="cycle_reverse_cost_time" index="33" name=""/>
    <alias field="walk_cost_time" index="34" name=""/>
    <alias field="walk_reverse_cost_time" index="35" name=""/>
    <alias field="car_cost_met" index="36" name=""/>
    <alias field="car_reverse_cost_met" index="37" name=""/>
    <alias field="bus_cost_met" index="38" name=""/>
    <alias field="bus_reverse_cost_met" index="39" name=""/>
    <alias field="tram_cost_met" index="40" name=""/>
    <alias field="tram_reverse_cost_met" index="41" name=""/>
    <alias field="cycle_cost_met" index="42" name=""/>
    <alias field="cycle_reverse_cost_met" index="43" name=""/>
    <alias field="walk_cost_met" index="44" name=""/>
    <alias field="walk_reverse_cost_met" index="45" name=""/>
    <alias field="car_speed" index="46" name=""/>
    <alias field="bus_speed" index="47" name=""/>
    <alias field="tram_speed" index="48" name=""/>
    <alias field="cycle_speed" index="49" name=""/>
    <alias field="walk_speed" index="50" name=""/>
    <alias field="car_allow" index="51" name=""/>
    <alias field="bus_allow" index="52" name=""/>
    <alias field="cycle_allow" index="53" name=""/>
    <alias field="walk_allow" index="54" name=""/>
    <alias field="tram_allow" index="55" name=""/>
    <alias field="park_allow" index="56" name=""/>
    <alias field="car_oneway" index="57" name=""/>
    <alias field="bus_oneway" index="58" name=""/>
    <alias field="tram_oneway" index="59" name=""/>
    <alias field="cycle_oneway" index="60" name=""/>
    <alias field="walk_oneway" index="61" name=""/>
    <alias field="startaltitude" index="62" name=""/>
    <alias field="endaltitude" index="63" name=""/>
    <alias field="percentslope" index="64" name=""/>
    <alias field="reversepercentslope" index="65" name=""/>
    <alias field="angleslope" index="66" name=""/>
    <alias field="reverseangleslope" index="67" name=""/>
    <alias field="totalascent" index="68" name=""/>
    <alias field="totaldescent" index="69" name=""/>
    <alias field="train_cost" index="70" name=""/>
    <alias field="train_reverse_cost" index="71" name=""/>
    <alias field="train_cost_time" index="72" name=""/>
    <alias field="train_reverse_cost_time" index="73" name=""/>
    <alias field="train_cost_met" index="74" name=""/>
    <alias field="train_reverse_cost_met" index="75" name=""/>
    <alias field="train_allow" index="76" name=""/>
    <alias field="train_oneway" index="77" name=""/>
    <alias field="train_speed" index="78" name=""/>
  </aliases>
  <excludeAttributesWMS/>
  <excludeAttributesWFS/>
  <defaults>
    <default field="id" applyOnUpdate="0" expression=""/>
    <default field="ways_id" applyOnUpdate="0" expression=""/>
    <default field="osm_id" applyOnUpdate="0" expression=""/>
    <default field="name" applyOnUpdate="0" expression=""/>
    <default field="highway" applyOnUpdate="0" expression=""/>
    <default field="z_order" applyOnUpdate="0" expression=""/>
    <default field="attrs" applyOnUpdate="0" expression=""/>
    <default field="source" applyOnUpdate="0" expression=""/>
    <default field="target" applyOnUpdate="0" expression=""/>
    <default field="length_m" applyOnUpdate="0" expression=""/>
    <default field="built_up" applyOnUpdate="0" expression=""/>
    <default field="has_bridge" applyOnUpdate="0" expression=""/>
    <default field="has_tunnel" applyOnUpdate="0" expression=""/>
    <default field="has_parking" applyOnUpdate="0" expression=""/>
    <default field="curve_index" applyOnUpdate="0" expression=""/>
    <default field="terrain_index" applyOnUpdate="0" expression=""/>
    <default field="car_cost" applyOnUpdate="0" expression=""/>
    <default field="car_reverse_cost" applyOnUpdate="0" expression=""/>
    <default field="bus_cost" applyOnUpdate="0" expression=""/>
    <default field="bus_reverse_cost" applyOnUpdate="0" expression=""/>
    <default field="tram_cost" applyOnUpdate="0" expression=""/>
    <default field="tram_reverse_cost" applyOnUpdate="0" expression=""/>
    <default field="cycle_cost" applyOnUpdate="0" expression=""/>
    <default field="cycle_reverse_cost" applyOnUpdate="0" expression=""/>
    <default field="walk_cost" applyOnUpdate="0" expression=""/>
    <default field="walk_reverse_cost" applyOnUpdate="0" expression=""/>
    <default field="car_cost_time" applyOnUpdate="0" expression=""/>
    <default field="car_reverse_cost_time" applyOnUpdate="0" expression=""/>
    <default field="bus_cost_time" applyOnUpdate="0" expression=""/>
    <default field="bus_reverse_cost_time" applyOnUpdate="0" expression=""/>
    <default field="tram_cost_time" applyOnUpdate="0" expression=""/>
    <default field="tram_reverse_cost_time" applyOnUpdate="0" expression=""/>
    <default field="cycle_cost_time" applyOnUpdate="0" expression=""/>
    <default field="cycle_reverse_cost_time" applyOnUpdate="0" expression=""/>
    <default field="walk_cost_time" applyOnUpdate="0" expression=""/>
    <default field="walk_reverse_cost_time" applyOnUpdate="0" expression=""/>
    <default field="car_cost_met" applyOnUpdate="0" expression=""/>
    <default field="car_reverse_cost_met" applyOnUpdate="0" expression=""/>
    <default field="bus_cost_met" applyOnUpdate="0" expression=""/>
    <default field="bus_reverse_cost_met" applyOnUpdate="0" expression=""/>
    <default field="tram_cost_met" applyOnUpdate="0" expression=""/>
    <default field="tram_reverse_cost_met" applyOnUpdate="0" expression=""/>
    <default field="cycle_cost_met" applyOnUpdate="0" expression=""/>
    <default field="cycle_reverse_cost_met" applyOnUpdate="0" expression=""/>
    <default field="walk_cost_met" applyOnUpdate="0" expression=""/>
    <default field="walk_reverse_cost_met" applyOnUpdate="0" expression=""/>
    <default field="car_speed" applyOnUpdate="0" expression=""/>
    <default field="bus_speed" applyOnUpdate="0" expression=""/>
    <default field="tram_speed" applyOnUpdate="0" expression=""/>
    <default field="cycle_speed" applyOnUpdate="0" expression=""/>
    <default field="walk_speed" applyOnUpdate="0" expression=""/>
    <default field="car_allow" applyOnUpdate="0" expression=""/>
    <default field="bus_allow" applyOnUpdate="0" expression=""/>
    <default field="cycle_allow" applyOnUpdate="0" expression=""/>
    <default field="walk_allow" applyOnUpdate="0" expression=""/>
    <default field="tram_allow" applyOnUpdate="0" expression=""/>
    <default field="park_allow" applyOnUpdate="0" expression=""/>
    <default field="car_oneway" applyOnUpdate="0" expression=""/>
    <default field="bus_oneway" applyOnUpdate="0" expression=""/>
    <default field="tram_oneway" applyOnUpdate="0" expression=""/>
    <default field="cycle_oneway" applyOnUpdate="0" expression=""/>
    <default field="walk_oneway" applyOnUpdate="0" expression=""/>
    <default field="startaltitude" applyOnUpdate="0" expression=""/>
    <default field="endaltitude" applyOnUpdate="0" expression=""/>
    <default field="percentslope" applyOnUpdate="0" expression=""/>
    <default field="reversepercentslope" applyOnUpdate="0" expression=""/>
    <default field="angleslope" applyOnUpdate="0" expression=""/>
    <default field="reverseangleslope" applyOnUpdate="0" expression=""/>
    <default field="totalascent" applyOnUpdate="0" expression=""/>
    <default field="totaldescent" applyOnUpdate="0" expression=""/>
    <default field="train_cost" applyOnUpdate="0" expression=""/>
    <default field="train_reverse_cost" applyOnUpdate="0" expression=""/>
    <default field="train_cost_time" applyOnUpdate="0" expression=""/>
    <default field="train_reverse_cost_time" applyOnUpdate="0" expression=""/>
    <default field="train_cost_met" applyOnUpdate="0" expression=""/>
    <default field="train_reverse_cost_met" applyOnUpdate="0" expression=""/>
    <default field="train_allow" applyOnUpdate="0" expression=""/>
    <default field="train_oneway" applyOnUpdate="0" expression=""/>
    <default field="train_speed" applyOnUpdate="0" expression=""/>
  </defaults>
  <constraints>
    <constraint field="id" notnull_strength="1" exp_strength="0" constraints="3" unique_strength="1"/>
    <constraint field="ways_id" notnull_strength="0" exp_strength="0" constraints="0" unique_strength="0"/>
    <constraint field="osm_id" notnull_strength="0" exp_strength="0" constraints="0" unique_strength="0"/>
    <constraint field="name" notnull_strength="0" exp_strength="0" constraints="0" unique_strength="0"/>
    <constraint field="highway" notnull_strength="0" exp_strength="0" constraints="0" unique_strength="0"/>
    <constraint field="z_order" notnull_strength="0" exp_strength="0" constraints="0" unique_strength="0"/>
    <constraint field="attrs" notnull_strength="0" exp_strength="0" constraints="0" unique_strength="0"/>
    <constraint field="source" notnull_strength="0" exp_strength="0" constraints="0" unique_strength="0"/>
    <constraint field="target" notnull_strength="0" exp_strength="0" constraints="0" unique_strength="0"/>
    <constraint field="length_m" notnull_strength="0" exp_strength="0" constraints="0" unique_strength="0"/>
    <constraint field="built_up" notnull_strength="0" exp_strength="0" constraints="0" unique_strength="0"/>
    <constraint field="has_bridge" notnull_strength="0" exp_strength="0" constraints="0" unique_strength="0"/>
    <constraint field="has_tunnel" notnull_strength="0" exp_strength="0" constraints="0" unique_strength="0"/>
    <constraint field="has_parking" notnull_strength="0" exp_strength="0" constraints="0" unique_strength="0"/>
    <constraint field="curve_index" notnull_strength="0" exp_strength="0" constraints="0" unique_strength="0"/>
    <constraint field="terrain_index" notnull_strength="0" exp_strength="0" constraints="0" unique_strength="0"/>
    <constraint field="car_cost" notnull_strength="0" exp_strength="0" constraints="0" unique_strength="0"/>
    <constraint field="car_reverse_cost" notnull_strength="0" exp_strength="0" constraints="0" unique_strength="0"/>
    <constraint field="bus_cost" notnull_strength="0" exp_strength="0" constraints="0" unique_strength="0"/>
    <constraint field="bus_reverse_cost" notnull_strength="0" exp_strength="0" constraints="0" unique_strength="0"/>
    <constraint field="tram_cost" notnull_strength="0" exp_strength="0" constraints="0" unique_strength="0"/>
    <constraint field="tram_reverse_cost" notnull_strength="0" exp_strength="0" constraints="0" unique_strength="0"/>
    <constraint field="cycle_cost" notnull_strength="0" exp_strength="0" constraints="0" unique_strength="0"/>
    <constraint field="cycle_reverse_cost" notnull_strength="0" exp_strength="0" constraints="0" unique_strength="0"/>
    <constraint field="walk_cost" notnull_strength="0" exp_strength="0" constraints="0" unique_strength="0"/>
    <constraint field="walk_reverse_cost" notnull_strength="0" exp_strength="0" constraints="0" unique_strength="0"/>
    <constraint field="car_cost_time" notnull_strength="0" exp_strength="0" constraints="0" unique_strength="0"/>
    <constraint field="car_reverse_cost_time" notnull_strength="0" exp_strength="0" constraints="0" unique_strength="0"/>
    <constraint field="bus_cost_time" notnull_strength="0" exp_strength="0" constraints="0" unique_strength="0"/>
    <constraint field="bus_reverse_cost_time" notnull_strength="0" exp_strength="0" constraints="0" unique_strength="0"/>
    <constraint field="tram_cost_time" notnull_strength="0" exp_strength="0" constraints="0" unique_strength="0"/>
    <constraint field="tram_reverse_cost_time" notnull_strength="0" exp_strength="0" constraints="0" unique_strength="0"/>
    <constraint field="cycle_cost_time" notnull_strength="0" exp_strength="0" constraints="0" unique_strength="0"/>
    <constraint field="cycle_reverse_cost_time" notnull_strength="0" exp_strength="0" constraints="0" unique_strength="0"/>
    <constraint field="walk_cost_time" notnull_strength="0" exp_strength="0" constraints="0" unique_strength="0"/>
    <constraint field="walk_reverse_cost_time" notnull_strength="0" exp_strength="0" constraints="0" unique_strength="0"/>
    <constraint field="car_cost_met" notnull_strength="0" exp_strength="0" constraints="0" unique_strength="0"/>
    <constraint field="car_reverse_cost_met" notnull_strength="0" exp_strength="0" constraints="0" unique_strength="0"/>
    <constraint field="bus_cost_met" notnull_strength="0" exp_strength="0" constraints="0" unique_strength="0"/>
    <constraint field="bus_reverse_cost_met" notnull_strength="0" exp_strength="0" constraints="0" unique_strength="0"/>
    <constraint field="tram_cost_met" notnull_strength="0" exp_strength="0" constraints="0" unique_strength="0"/>
    <constraint field="tram_reverse_cost_met" notnull_strength="0" exp_strength="0" constraints="0" unique_strength="0"/>
    <constraint field="cycle_cost_met" notnull_strength="0" exp_strength="0" constraints="0" unique_strength="0"/>
    <constraint field="cycle_reverse_cost_met" notnull_strength="0" exp_strength="0" constraints="0" unique_strength="0"/>
    <constraint field="walk_cost_met" notnull_strength="0" exp_strength="0" constraints="0" unique_strength="0"/>
    <constraint field="walk_reverse_cost_met" notnull_strength="0" exp_strength="0" constraints="0" unique_strength="0"/>
    <constraint field="car_speed" notnull_strength="0" exp_strength="0" constraints="0" unique_strength="0"/>
    <constraint field="bus_speed" notnull_strength="0" exp_strength="0" constraints="0" unique_strength="0"/>
    <constraint field="tram_speed" notnull_strength="0" exp_strength="0" constraints="0" unique_strength="0"/>
    <constraint field="cycle_speed" notnull_strength="0" exp_strength="0" constraints="0" unique_strength="0"/>
    <constraint field="walk_speed" notnull_strength="0" exp_strength="0" constraints="0" unique_strength="0"/>
    <constraint field="car_allow" notnull_strength="0" exp_strength="0" constraints="0" unique_strength="0"/>
    <constraint field="bus_allow" notnull_strength="0" exp_strength="0" constraints="0" unique_strength="0"/>
    <constraint field="cycle_allow" notnull_strength="0" exp_strength="0" constraints="0" unique_strength="0"/>
    <constraint field="walk_allow" notnull_strength="0" exp_strength="0" constraints="0" unique_strength="0"/>
    <constraint field="tram_allow" notnull_strength="0" exp_strength="0" constraints="0" unique_strength="0"/>
    <constraint field="park_allow" notnull_strength="0" exp_strength="0" constraints="0" unique_strength="0"/>
    <constraint field="car_oneway" notnull_strength="0" exp_strength="0" constraints="0" unique_strength="0"/>
    <constraint field="bus_oneway" notnull_strength="0" exp_strength="0" constraints="0" unique_strength="0"/>
    <constraint field="tram_oneway" notnull_strength="0" exp_strength="0" constraints="0" unique_strength="0"/>
    <constraint field="cycle_oneway" notnull_strength="0" exp_strength="0" constraints="0" unique_strength="0"/>
    <constraint field="walk_oneway" notnull_strength="0" exp_strength="0" constraints="0" unique_strength="0"/>
    <constraint field="startaltitude" notnull_strength="0" exp_strength="0" constraints="0" unique_strength="0"/>
    <constraint field="endaltitude" notnull_strength="0" exp_strength="0" constraints="0" unique_strength="0"/>
    <constraint field="percentslope" notnull_strength="0" exp_strength="0" constraints="0" unique_strength="0"/>
    <constraint field="reversepercentslope" notnull_strength="0" exp_strength="0" constraints="0" unique_strength="0"/>
    <constraint field="angleslope" notnull_strength="0" exp_strength="0" constraints="0" unique_strength="0"/>
    <constraint field="reverseangleslope" notnull_strength="0" exp_strength="0" constraints="0" unique_strength="0"/>
    <constraint field="totalascent" notnull_strength="0" exp_strength="0" constraints="0" unique_strength="0"/>
    <constraint field="totaldescent" notnull_strength="0" exp_strength="0" constraints="0" unique_strength="0"/>
    <constraint field="train_cost" notnull_strength="0" exp_strength="0" constraints="0" unique_strength="0"/>
    <constraint field="train_reverse_cost" notnull_strength="0" exp_strength="0" constraints="0" unique_strength="0"/>
    <constraint field="train_cost_time" notnull_strength="0" exp_strength="0" constraints="0" unique_strength="0"/>
    <constraint field="train_reverse_cost_time" notnull_strength="0" exp_strength="0" constraints="0" unique_strength="0"/>
    <constraint field="train_cost_met" notnull_strength="0" exp_strength="0" constraints="0" unique_strength="0"/>
    <constraint field="train_reverse_cost_met" notnull_strength="0" exp_strength="0" constraints="0" unique_strength="0"/>
    <constraint field="train_allow" notnull_strength="0" exp_strength="0" constraints="0" unique_strength="0"/>
    <constraint field="train_oneway" notnull_strength="0" exp_strength="0" constraints="0" unique_strength="0"/>
    <constraint field="train_speed" notnull_strength="0" exp_strength="0" constraints="0" unique_strength="0"/>
  </constraints>
  <constraintExpressions>
    <constraint field="id" desc="" exp=""/>
    <constraint field="ways_id" desc="" exp=""/>
    <constraint field="osm_id" desc="" exp=""/>
    <constraint field="name" desc="" exp=""/>
    <constraint field="highway" desc="" exp=""/>
    <constraint field="z_order" desc="" exp=""/>
    <constraint field="attrs" desc="" exp=""/>
    <constraint field="source" desc="" exp=""/>
    <constraint field="target" desc="" exp=""/>
    <constraint field="length_m" desc="" exp=""/>
    <constraint field="built_up" desc="" exp=""/>
    <constraint field="has_bridge" desc="" exp=""/>
    <constraint field="has_tunnel" desc="" exp=""/>
    <constraint field="has_parking" desc="" exp=""/>
    <constraint field="curve_index" desc="" exp=""/>
    <constraint field="terrain_index" desc="" exp=""/>
    <constraint field="car_cost" desc="" exp=""/>
    <constraint field="car_reverse_cost" desc="" exp=""/>
    <constraint field="bus_cost" desc="" exp=""/>
    <constraint field="bus_reverse_cost" desc="" exp=""/>
    <constraint field="tram_cost" desc="" exp=""/>
    <constraint field="tram_reverse_cost" desc="" exp=""/>
    <constraint field="cycle_cost" desc="" exp=""/>
    <constraint field="cycle_reverse_cost" desc="" exp=""/>
    <constraint field="walk_cost" desc="" exp=""/>
    <constraint field="walk_reverse_cost" desc="" exp=""/>
    <constraint field="car_cost_time" desc="" exp=""/>
    <constraint field="car_reverse_cost_time" desc="" exp=""/>
    <constraint field="bus_cost_time" desc="" exp=""/>
    <constraint field="bus_reverse_cost_time" desc="" exp=""/>
    <constraint field="tram_cost_time" desc="" exp=""/>
    <constraint field="tram_reverse_cost_time" desc="" exp=""/>
    <constraint field="cycle_cost_time" desc="" exp=""/>
    <constraint field="cycle_reverse_cost_time" desc="" exp=""/>
    <constraint field="walk_cost_time" desc="" exp=""/>
    <constraint field="walk_reverse_cost_time" desc="" exp=""/>
    <constraint field="car_cost_met" desc="" exp=""/>
    <constraint field="car_reverse_cost_met" desc="" exp=""/>
    <constraint field="bus_cost_met" desc="" exp=""/>
    <constraint field="bus_reverse_cost_met" desc="" exp=""/>
    <constraint field="tram_cost_met" desc="" exp=""/>
    <constraint field="tram_reverse_cost_met" desc="" exp=""/>
    <constraint field="cycle_cost_met" desc="" exp=""/>
    <constraint field="cycle_reverse_cost_met" desc="" exp=""/>
    <constraint field="walk_cost_met" desc="" exp=""/>
    <constraint field="walk_reverse_cost_met" desc="" exp=""/>
    <constraint field="car_speed" desc="" exp=""/>
    <constraint field="bus_speed" desc="" exp=""/>
    <constraint field="tram_speed" desc="" exp=""/>
    <constraint field="cycle_speed" desc="" exp=""/>
    <constraint field="walk_speed" desc="" exp=""/>
    <constraint field="car_allow" desc="" exp=""/>
    <constraint field="bus_allow" desc="" exp=""/>
    <constraint field="cycle_allow" desc="" exp=""/>
    <constraint field="walk_allow" desc="" exp=""/>
    <constraint field="tram_allow" desc="" exp=""/>
    <constraint field="park_allow" desc="" exp=""/>
    <constraint field="car_oneway" desc="" exp=""/>
    <constraint field="bus_oneway" desc="" exp=""/>
    <constraint field="tram_oneway" desc="" exp=""/>
    <constraint field="cycle_oneway" desc="" exp=""/>
    <constraint field="walk_oneway" desc="" exp=""/>
    <constraint field="startaltitude" desc="" exp=""/>
    <constraint field="endaltitude" desc="" exp=""/>
    <constraint field="percentslope" desc="" exp=""/>
    <constraint field="reversepercentslope" desc="" exp=""/>
    <constraint field="angleslope" desc="" exp=""/>
    <constraint field="reverseangleslope" desc="" exp=""/>
    <constraint field="totalascent" desc="" exp=""/>
    <constraint field="totaldescent" desc="" exp=""/>
    <constraint field="train_cost" desc="" exp=""/>
    <constraint field="train_reverse_cost" desc="" exp=""/>
    <constraint field="train_cost_time" desc="" exp=""/>
    <constraint field="train_reverse_cost_time" desc="" exp=""/>
    <constraint field="train_cost_met" desc="" exp=""/>
    <constraint field="train_reverse_cost_met" desc="" exp=""/>
    <constraint field="train_allow" desc="" exp=""/>
    <constraint field="train_oneway" desc="" exp=""/>
    <constraint field="train_speed" desc="" exp=""/>
  </constraintExpressions>
  <expressionfields/>
  <attributeactions>
    <defaultAction key="Canvas" value="{00000000-0000-0000-0000-000000000000}"/>
  </attributeactions>
  <attributetableconfig sortOrder="0" actionWidgetStyle="dropDown" sortExpression="">
    <columns>
      <column hidden="0" type="field" name="id" width="-1"/>
      <column hidden="0" type="field" name="osm_id" width="-1"/>
      <column hidden="0" type="field" name="name" width="-1"/>
      <column hidden="0" type="field" name="highway" width="-1"/>
      <column hidden="0" type="field" name="z_order" width="-1"/>
      <column hidden="0" type="field" name="attrs" width="-1"/>
      <column hidden="1" type="actions" width="-1"/>
      <column hidden="0" type="field" name="ways_id" width="-1"/>
      <column hidden="0" type="field" name="source" width="-1"/>
      <column hidden="0" type="field" name="target" width="-1"/>
      <column hidden="0" type="field" name="length_m" width="-1"/>
      <column hidden="0" type="field" name="built_up" width="-1"/>
      <column hidden="0" type="field" name="has_bridge" width="-1"/>
      <column hidden="0" type="field" name="has_tunnel" width="-1"/>
      <column hidden="0" type="field" name="has_parking" width="-1"/>
      <column hidden="0" type="field" name="curve_index" width="-1"/>
      <column hidden="0" type="field" name="terrain_index" width="-1"/>
      <column hidden="0" type="field" name="car_cost" width="-1"/>
      <column hidden="0" type="field" name="car_reverse_cost" width="-1"/>
      <column hidden="0" type="field" name="bus_cost" width="-1"/>
      <column hidden="0" type="field" name="bus_reverse_cost" width="-1"/>
      <column hidden="0" type="field" name="tram_cost" width="-1"/>
      <column hidden="0" type="field" name="tram_reverse_cost" width="-1"/>
      <column hidden="0" type="field" name="cycle_cost" width="-1"/>
      <column hidden="0" type="field" name="cycle_reverse_cost" width="-1"/>
      <column hidden="0" type="field" name="walk_cost" width="-1"/>
      <column hidden="0" type="field" name="walk_reverse_cost" width="-1"/>
      <column hidden="0" type="field" name="car_cost_time" width="-1"/>
      <column hidden="0" type="field" name="car_reverse_cost_time" width="-1"/>
      <column hidden="0" type="field" name="bus_cost_time" width="-1"/>
      <column hidden="0" type="field" name="bus_reverse_cost_time" width="-1"/>
      <column hidden="0" type="field" name="tram_cost_time" width="-1"/>
      <column hidden="0" type="field" name="tram_reverse_cost_time" width="-1"/>
      <column hidden="0" type="field" name="cycle_cost_time" width="-1"/>
      <column hidden="0" type="field" name="cycle_reverse_cost_time" width="-1"/>
      <column hidden="0" type="field" name="walk_cost_time" width="-1"/>
      <column hidden="0" type="field" name="walk_reverse_cost_time" width="-1"/>
      <column hidden="0" type="field" name="car_cost_met" width="-1"/>
      <column hidden="0" type="field" name="car_reverse_cost_met" width="-1"/>
      <column hidden="0" type="field" name="bus_cost_met" width="-1"/>
      <column hidden="0" type="field" name="bus_reverse_cost_met" width="-1"/>
      <column hidden="0" type="field" name="tram_cost_met" width="-1"/>
      <column hidden="0" type="field" name="tram_reverse_cost_met" width="-1"/>
      <column hidden="0" type="field" name="cycle_cost_met" width="-1"/>
      <column hidden="0" type="field" name="cycle_reverse_cost_met" width="-1"/>
      <column hidden="0" type="field" name="walk_cost_met" width="-1"/>
      <column hidden="0" type="field" name="walk_reverse_cost_met" width="-1"/>
      <column hidden="0" type="field" name="car_speed" width="-1"/>
      <column hidden="0" type="field" name="bus_speed" width="-1"/>
      <column hidden="0" type="field" name="tram_speed" width="-1"/>
      <column hidden="0" type="field" name="cycle_speed" width="-1"/>
      <column hidden="0" type="field" name="walk_speed" width="-1"/>
      <column hidden="0" type="field" name="car_allow" width="-1"/>
      <column hidden="0" type="field" name="bus_allow" width="-1"/>
      <column hidden="0" type="field" name="cycle_allow" width="-1"/>
      <column hidden="0" type="field" name="walk_allow" width="-1"/>
      <column hidden="0" type="field" name="tram_allow" width="-1"/>
      <column hidden="0" type="field" name="park_allow" width="-1"/>
      <column hidden="0" type="field" name="car_oneway" width="-1"/>
      <column hidden="0" type="field" name="bus_oneway" width="-1"/>
      <column hidden="0" type="field" name="tram_oneway" width="-1"/>
      <column hidden="0" type="field" name="cycle_oneway" width="-1"/>
      <column hidden="0" type="field" name="walk_oneway" width="-1"/>
      <column hidden="0" type="field" name="startaltitude" width="-1"/>
      <column hidden="0" type="field" name="endaltitude" width="-1"/>
      <column hidden="0" type="field" name="percentslope" width="-1"/>
      <column hidden="0" type="field" name="reversepercentslope" width="-1"/>
      <column hidden="0" type="field" name="angleslope" width="-1"/>
      <column hidden="0" type="field" name="reverseangleslope" width="-1"/>
      <column hidden="0" type="field" name="totalascent" width="-1"/>
      <column hidden="0" type="field" name="totaldescent" width="-1"/>
      <column hidden="0" type="field" name="train_cost" width="-1"/>
      <column hidden="0" type="field" name="train_reverse_cost" width="-1"/>
      <column hidden="0" type="field" name="train_cost_time" width="-1"/>
      <column hidden="0" type="field" name="train_reverse_cost_time" width="-1"/>
      <column hidden="0" type="field" name="train_cost_met" width="-1"/>
      <column hidden="0" type="field" name="train_reverse_cost_met" width="-1"/>
      <column hidden="0" type="field" name="train_allow" width="-1"/>
      <column hidden="0" type="field" name="train_oneway" width="-1"/>
      <column hidden="0" type="field" name="train_speed" width="-1"/>
    </columns>
  </attributetableconfig>
  <conditionalstyles>
    <rowstyles/>
    <fieldstyles/>
  </conditionalstyles>
  <editform tolerant="1">C:/PROGRA~1/QGIS3~1.4/bin</editform>
  <editforminit/>
  <editforminitcodesource>0</editforminitcodesource>
  <editforminitfilepath>C:/PROGRA~1/QGIS3~1.4/bin</editforminitfilepath>
  <editforminitcode><![CDATA[# -*- coding: utf-8 -*-
"""
QGIS forms can have a Python function that is called when the form is
opened.

Use this function to add extra logic to your forms.

Enter the name of the function in the "Python Init function"
field.
An example follows:
"""
from qgis.PyQt.QtWidgets import QWidget

def my_form_open(dialog, layer, feature):
	geom = feature.geometry()
	control = dialog.findChild(QWidget, "MyLineEdit")
]]></editforminitcode>
  <featformsuppress>0</featformsuppress>
  <editorlayout>generatedlayout</editorlayout>
  <editable>
    <field editable="1" name="angleslope"/>
    <field editable="1" name="attrs"/>
    <field editable="1" name="built_up"/>
    <field editable="1" name="bus_allow"/>
    <field editable="1" name="bus_cost"/>
    <field editable="1" name="bus_cost_met"/>
    <field editable="1" name="bus_cost_time"/>
    <field editable="1" name="bus_oneway"/>
    <field editable="1" name="bus_reverse_cost"/>
    <field editable="1" name="bus_reverse_cost_met"/>
    <field editable="1" name="bus_reverse_cost_time"/>
    <field editable="1" name="bus_speed"/>
    <field editable="1" name="car_allow"/>
    <field editable="1" name="car_cost"/>
    <field editable="1" name="car_cost_met"/>
    <field editable="1" name="car_cost_time"/>
    <field editable="1" name="car_oneway"/>
    <field editable="1" name="car_reverse_cost"/>
    <field editable="1" name="car_reverse_cost_met"/>
    <field editable="1" name="car_reverse_cost_time"/>
    <field editable="1" name="car_speed"/>
    <field editable="1" name="curve_index"/>
    <field editable="1" name="cycle_allow"/>
    <field editable="1" name="cycle_cost"/>
    <field editable="1" name="cycle_cost_met"/>
    <field editable="1" name="cycle_cost_time"/>
    <field editable="1" name="cycle_oneway"/>
    <field editable="1" name="cycle_reverse_cost"/>
    <field editable="1" name="cycle_reverse_cost_met"/>
    <field editable="1" name="cycle_reverse_cost_time"/>
    <field editable="1" name="cycle_speed"/>
    <field editable="1" name="endaltitude"/>
    <field editable="1" name="has_bridge"/>
    <field editable="1" name="has_parking"/>
    <field editable="1" name="has_tunnel"/>
    <field editable="1" name="highway"/>
    <field editable="1" name="id"/>
    <field editable="1" name="length_m"/>
    <field editable="1" name="name"/>
    <field editable="1" name="osm_id"/>
    <field editable="1" name="park_allow"/>
    <field editable="1" name="percentslope"/>
    <field editable="1" name="reverseangleslope"/>
    <field editable="1" name="reversepercentslope"/>
    <field editable="1" name="source"/>
    <field editable="1" name="startaltitude"/>
    <field editable="1" name="target"/>
    <field editable="1" name="terrain_index"/>
    <field editable="1" name="totalascent"/>
    <field editable="1" name="totaldescent"/>
    <field editable="1" name="train_allow"/>
    <field editable="1" name="train_cost"/>
    <field editable="1" name="train_cost_met"/>
    <field editable="1" name="train_cost_time"/>
    <field editable="1" name="train_oneway"/>
    <field editable="1" name="train_reverse_cost"/>
    <field editable="1" name="train_reverse_cost_met"/>
    <field editable="1" name="train_reverse_cost_time"/>
    <field editable="1" name="train_speed"/>
    <field editable="1" name="tram_allow"/>
    <field editable="1" name="tram_cost"/>
    <field editable="1" name="tram_cost_met"/>
    <field editable="1" name="tram_cost_time"/>
    <field editable="1" name="tram_oneway"/>
    <field editable="1" name="tram_reverse_cost"/>
    <field editable="1" name="tram_reverse_cost_met"/>
    <field editable="1" name="tram_reverse_cost_time"/>
    <field editable="1" name="tram_speed"/>
    <field editable="1" name="walk_allow"/>
    <field editable="1" name="walk_cost"/>
    <field editable="1" name="walk_cost_met"/>
    <field editable="1" name="walk_cost_time"/>
    <field editable="1" name="walk_oneway"/>
    <field editable="1" name="walk_reverse_cost"/>
    <field editable="1" name="walk_reverse_cost_met"/>
    <field editable="1" name="walk_reverse_cost_time"/>
    <field editable="1" name="walk_speed"/>
    <field editable="1" name="ways_id"/>
    <field editable="1" name="z_order"/>
  </editable>
  <labelOnTop>
    <field labelOnTop="0" name="angleslope"/>
    <field labelOnTop="0" name="attrs"/>
    <field labelOnTop="0" name="built_up"/>
    <field labelOnTop="0" name="bus_allow"/>
    <field labelOnTop="0" name="bus_cost"/>
    <field labelOnTop="0" name="bus_cost_met"/>
    <field labelOnTop="0" name="bus_cost_time"/>
    <field labelOnTop="0" name="bus_oneway"/>
    <field labelOnTop="0" name="bus_reverse_cost"/>
    <field labelOnTop="0" name="bus_reverse_cost_met"/>
    <field labelOnTop="0" name="bus_reverse_cost_time"/>
    <field labelOnTop="0" name="bus_speed"/>
    <field labelOnTop="0" name="car_allow"/>
    <field labelOnTop="0" name="car_cost"/>
    <field labelOnTop="0" name="car_cost_met"/>
    <field labelOnTop="0" name="car_cost_time"/>
    <field labelOnTop="0" name="car_oneway"/>
    <field labelOnTop="0" name="car_reverse_cost"/>
    <field labelOnTop="0" name="car_reverse_cost_met"/>
    <field labelOnTop="0" name="car_reverse_cost_time"/>
    <field labelOnTop="0" name="car_speed"/>
    <field labelOnTop="0" name="curve_index"/>
    <field labelOnTop="0" name="cycle_allow"/>
    <field labelOnTop="0" name="cycle_cost"/>
    <field labelOnTop="0" name="cycle_cost_met"/>
    <field labelOnTop="0" name="cycle_cost_time"/>
    <field labelOnTop="0" name="cycle_oneway"/>
    <field labelOnTop="0" name="cycle_reverse_cost"/>
    <field labelOnTop="0" name="cycle_reverse_cost_met"/>
    <field labelOnTop="0" name="cycle_reverse_cost_time"/>
    <field labelOnTop="0" name="cycle_speed"/>
    <field labelOnTop="0" name="endaltitude"/>
    <field labelOnTop="0" name="has_bridge"/>
    <field labelOnTop="0" name="has_parking"/>
    <field labelOnTop="0" name="has_tunnel"/>
    <field labelOnTop="0" name="highway"/>
    <field labelOnTop="0" name="id"/>
    <field labelOnTop="0" name="length_m"/>
    <field labelOnTop="0" name="name"/>
    <field labelOnTop="0" name="osm_id"/>
    <field labelOnTop="0" name="park_allow"/>
    <field labelOnTop="0" name="percentslope"/>
    <field labelOnTop="0" name="reverseangleslope"/>
    <field labelOnTop="0" name="reversepercentslope"/>
    <field labelOnTop="0" name="source"/>
    <field labelOnTop="0" name="startaltitude"/>
    <field labelOnTop="0" name="target"/>
    <field labelOnTop="0" name="terrain_index"/>
    <field labelOnTop="0" name="totalascent"/>
    <field labelOnTop="0" name="totaldescent"/>
    <field labelOnTop="0" name="train_allow"/>
    <field labelOnTop="0" name="train_cost"/>
    <field labelOnTop="0" name="train_cost_met"/>
    <field labelOnTop="0" name="train_cost_time"/>
    <field labelOnTop="0" name="train_oneway"/>
    <field labelOnTop="0" name="train_reverse_cost"/>
    <field labelOnTop="0" name="train_reverse_cost_met"/>
    <field labelOnTop="0" name="train_reverse_cost_time"/>
    <field labelOnTop="0" name="train_speed"/>
    <field labelOnTop="0" name="tram_allow"/>
    <field labelOnTop="0" name="tram_cost"/>
    <field labelOnTop="0" name="tram_cost_met"/>
    <field labelOnTop="0" name="tram_cost_time"/>
    <field labelOnTop="0" name="tram_oneway"/>
    <field labelOnTop="0" name="tram_reverse_cost"/>
    <field labelOnTop="0" name="tram_reverse_cost_met"/>
    <field labelOnTop="0" name="tram_reverse_cost_time"/>
    <field labelOnTop="0" name="tram_speed"/>
    <field labelOnTop="0" name="walk_allow"/>
    <field labelOnTop="0" name="walk_cost"/>
    <field labelOnTop="0" name="walk_cost_met"/>
    <field labelOnTop="0" name="walk_cost_time"/>
    <field labelOnTop="0" name="walk_oneway"/>
    <field labelOnTop="0" name="walk_reverse_cost"/>
    <field labelOnTop="0" name="walk_reverse_cost_met"/>
    <field labelOnTop="0" name="walk_reverse_cost_time"/>
    <field labelOnTop="0" name="walk_speed"/>
    <field labelOnTop="0" name="ways_id"/>
    <field labelOnTop="0" name="z_order"/>
  </labelOnTop>
  <widgets/>
  <previewExpression>name</previewExpression>
  <mapTip></mapTip>
  <layerGeometryType>1</layerGeometryType>
</qgis>
