<!DOCTYPE qgis PUBLIC 'http://mrcc.com/qgis.dtd' 'SYSTEM'>
<qgis version="3.6.0-Noosa" simplifyDrawingHints="1" simplifyDrawingTol="1" simplifyAlgorithm="0" styleCategories="AllStyleCategories" hasScaleBasedVisibilityFlag="0" simplifyMaxScale="1" readOnly="0" simplifyLocal="1" labelsEnabled="0" minScale="1e+08" maxScale="0">
  <flags>
    <Identifiable>1</Identifiable>
    <Removable>1</Removable>
    <Searchable>1</Searchable>
  </flags>
  <renderer-v2 symbollevels="0" forceraster="0" type="singleSymbol" enableorderby="0">
    <symbols>
      <symbol type="line" clip_to_extent="1" force_rhr="0" name="0" alpha="1">
        <layer enabled="1" locked="0" pass="0" class="GeometryGenerator">
          <prop v="Line" k="SymbolType"/>
          <prop v="difference(&#xd;&#xa;   difference(&#xd;&#xa;      make_line(&#xd;&#xa;         start_point($geometry),&#xd;&#xa;         centroid(&#xd;&#xa;            offset_curve(&#xd;&#xa;               $geometry, &#xd;&#xa;               length($geometry)/-5.0&#xd;&#xa;            )&#xd;&#xa;         ),&#xd;&#xa;     end_point($geometry)&#xd;&#xa;      ),&#xd;&#xa;      buffer(start_point($geometry), 0.01)&#xd;&#xa;   ),&#xd;&#xa;   buffer(end_point( $geometry), 0.01)&#xd;&#xa;)" k="geometryModifier"/>
          <data_defined_properties>
            <Option type="Map">
              <Option type="QString" name="name" value=""/>
              <Option name="properties"/>
              <Option type="QString" name="type" value="collection"/>
            </Option>
          </data_defined_properties>
          <symbol type="line" clip_to_extent="1" force_rhr="0" name="@0@0" alpha="1">
            <layer enabled="1" locked="0" pass="0" class="ArrowLine">
              <prop v="1" k="arrow_start_width"/>
              <prop v="MM" k="arrow_start_width_unit"/>
              <prop v="3x:0,0,0,0,0,0" k="arrow_start_width_unit_scale"/>
              <prop v="0" k="arrow_type"/>
              <prop v="1" k="arrow_width"/>
              <prop v="MM" k="arrow_width_unit"/>
              <prop v="3x:0,0,0,0,0,0" k="arrow_width_unit_scale"/>
              <prop v="1.5" k="head_length"/>
              <prop v="MM" k="head_length_unit"/>
              <prop v="3x:0,0,0,0,0,0" k="head_length_unit_scale"/>
              <prop v="1.5" k="head_thickness"/>
              <prop v="MM" k="head_thickness_unit"/>
              <prop v="3x:0,0,0,0,0,0" k="head_thickness_unit_scale"/>
              <prop v="0" k="head_type"/>
              <prop v="1" k="is_curved"/>
              <prop v="1" k="is_repeated"/>
              <prop v="0" k="offset"/>
              <prop v="MM" k="offset_unit"/>
              <prop v="3x:0,0,0,0,0,0" k="offset_unit_scale"/>
              <prop v="0" k="ring_filter"/>
              <data_defined_properties>
                <Option type="Map">
                  <Option type="QString" name="name" value=""/>
                  <Option type="Map" name="properties">
                    <Option type="Map" name="arrowHeadLength">
                      <Option type="bool" name="active" value="true"/>
                      <Option type="QString" name="expression" value="scale_linear(&quot;count&quot;, 6, 50, 0.1, 3)&#xa;+ 1.5"/>
                      <Option type="int" name="type" value="3"/>
                    </Option>
                    <Option type="Map" name="arrowHeadThickness">
                      <Option type="bool" name="active" value="true"/>
                      <Option type="QString" name="expression" value="scale_linear(&quot;count&quot;, 6, 50, 0.1, 3) + 1.5"/>
                      <Option type="int" name="type" value="3"/>
                    </Option>
                    <Option type="Map" name="arrowStartWidth">
                      <Option type="bool" name="active" value="true"/>
                      <Option type="QString" name="expression" value="scale_linear(&quot;count&quot;, 6, 50 , 0.2, 5)"/>
                      <Option type="int" name="type" value="3"/>
                    </Option>
                    <Option type="Map" name="arrowWidth">
                      <Option type="bool" name="active" value="true"/>
                      <Option type="QString" name="expression" value="scale_linear( &quot;count&quot; , 6, 50 , 0.2, 5)"/>
                      <Option type="int" name="type" value="3"/>
                    </Option>
                  </Option>
                  <Option type="QString" name="type" value="collection"/>
                </Option>
              </data_defined_properties>
              <symbol type="fill" clip_to_extent="1" force_rhr="0" name="@@0@0@0" alpha="1">
                <layer enabled="1" locked="0" pass="0" class="GradientFill">
                  <prop v="0" k="angle"/>
                  <prop v="34,94,168,255" k="color"/>
                  <prop v="0,0,255,255" k="color1"/>
                  <prop v="0,255,0,255" k="color2"/>
                  <prop v="0" k="color_type"/>
                  <prop v="0" k="coordinate_mode"/>
                  <prop v="0" k="discrete"/>
                  <prop v="255,255,255,255" k="gradient_color2"/>
                  <prop v="0,0" k="offset"/>
                  <prop v="3x:0,0,0,0,0,0" k="offset_map_unit_scale"/>
                  <prop v="MM" k="offset_unit"/>
                  <prop v="gradient" k="rampType"/>
                  <prop v="0.5,0" k="reference_point1"/>
                  <prop v="0" k="reference_point1_iscentroid"/>
                  <prop v="0.5,1" k="reference_point2"/>
                  <prop v="0" k="reference_point2_iscentroid"/>
                  <prop v="0" k="spread"/>
                  <prop v="0" k="type"/>
                  <data_defined_properties>
                    <Option type="Map">
                      <Option type="QString" name="name" value=""/>
                      <Option type="Map" name="properties">
                        <Option type="Map" name="color2">
                          <Option type="bool" name="active" value="true"/>
                          <Option type="QString" name="expression" value="CASE &#xd;&#xa;WHEN  &quot;flow_direction&quot; = 'out' THEN '#225ea8'&#xd;&#xa;WHEN  &quot;flow_direction&quot; = 'in' THEN '#cc4c02'&#xd;&#xa;ELSE '#cc4c02'&#xd;&#xa;END"/>
                          <Option type="int" name="type" value="3"/>
                        </Option>
                        <Option type="Map" name="fillColor">
                          <Option type="bool" name="active" value="true"/>
                          <Option type="QString" name="expression" value="CASE &#xd;&#xa;WHEN  &quot;flow_direction&quot; = 'out' THEN '#225ea8'&#xd;&#xa;WHEN  &quot;flow_direction&quot; = 'in' THEN '#cc4c02'&#xd;&#xa;ELSE '#225ea8'&#xd;&#xa;END"/>
                          <Option type="int" name="type" value="3"/>
                        </Option>
                      </Option>
                      <Option type="QString" name="type" value="collection"/>
                    </Option>
                  </data_defined_properties>
                </layer>
              </symbol>
            </layer>
          </symbol>
        </layer>
      </symbol>
    </symbols>
    <rotation/>
    <sizescale/>
  </renderer-v2>
  <customproperties>
    <property key="dualview/previewExpressions">
      <value>id</value>
      <value>"id"</value>
      <value>id</value>
    </property>
    <property value="0" key="embeddedWidgets/count"/>
    <property key="variableNames"/>
    <property key="variableValues"/>
  </customproperties>
  <blendMode>0</blendMode>
  <featureBlendMode>6</featureBlendMode>
  <layerOpacity>1</layerOpacity>
  <SingleCategoryDiagramRenderer attributeLegend="1" diagramType="Histogram">
    <DiagramCategory minScaleDenominator="0" lineSizeType="MM" scaleBasedVisibility="0" width="15" penColor="#000000" labelPlacementMethod="XHeight" penWidth="0" height="15" barWidth="5" sizeType="MM" sizeScale="3x:0,0,0,0,0,0" rotationOffset="270" enabled="0" minimumSize="0" lineSizeScale="3x:0,0,0,0,0,0" backgroundAlpha="255" penAlpha="255" scaleDependency="Area" backgroundColor="#ffffff" maxScaleDenominator="1e+08" diagramOrientation="Up" opacity="1">
      <fontProperties style="" description="MS Shell Dlg 2,8.25,-1,5,50,0,0,0,0,0"/>
      <attribute color="#000000" label="" field=""/>
    </DiagramCategory>
  </SingleCategoryDiagramRenderer>
  <DiagramLayerSettings placement="2" zIndex="0" showAll="1" priority="0" obstacle="0" linePlacementFlags="18" dist="0">
    <properties>
      <Option type="Map">
        <Option type="QString" name="name" value=""/>
        <Option name="properties"/>
        <Option type="QString" name="type" value="collection"/>
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
    <field name="source_oa">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="target_oa">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="count">
      <editWidget type="Range">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="code">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="ovrk2015">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="decile">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="quintile">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="hlth2015">
      <editWidget type="Range">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="hlthdecile">
      <editWidget type="Range">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="hlthquintile">
      <editWidget type="Range">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="flow_direction">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
  </fieldConfiguration>
  <aliases>
    <alias name="" index="0" field="id"/>
    <alias name="" index="1" field="source_oa"/>
    <alias name="" index="2" field="target_oa"/>
    <alias name="" index="3" field="count"/>
    <alias name="" index="4" field="code"/>
    <alias name="" index="5" field="ovrk2015"/>
    <alias name="" index="6" field="decile"/>
    <alias name="" index="7" field="quintile"/>
    <alias name="" index="8" field="hlth2015"/>
    <alias name="" index="9" field="hlthdecile"/>
    <alias name="" index="10" field="hlthquintile"/>
    <alias name="" index="11" field="flow_direction"/>
  </aliases>
  <excludeAttributesWMS/>
  <excludeAttributesWFS/>
  <defaults>
    <default applyOnUpdate="0" expression="" field="id"/>
    <default applyOnUpdate="0" expression="" field="source_oa"/>
    <default applyOnUpdate="0" expression="" field="target_oa"/>
    <default applyOnUpdate="0" expression="" field="count"/>
    <default applyOnUpdate="0" expression="" field="code"/>
    <default applyOnUpdate="0" expression="" field="ovrk2015"/>
    <default applyOnUpdate="0" expression="" field="decile"/>
    <default applyOnUpdate="0" expression="" field="quintile"/>
    <default applyOnUpdate="0" expression="" field="hlth2015"/>
    <default applyOnUpdate="0" expression="" field="hlthdecile"/>
    <default applyOnUpdate="0" expression="" field="hlthquintile"/>
    <default applyOnUpdate="0" expression="" field="flow_direction"/>
  </defaults>
  <constraints>
    <constraint notnull_strength="1" constraints="3" exp_strength="0" unique_strength="1" field="id"/>
    <constraint notnull_strength="0" constraints="0" exp_strength="0" unique_strength="0" field="source_oa"/>
    <constraint notnull_strength="0" constraints="0" exp_strength="0" unique_strength="0" field="target_oa"/>
    <constraint notnull_strength="0" constraints="0" exp_strength="0" unique_strength="0" field="count"/>
    <constraint notnull_strength="0" constraints="0" exp_strength="0" unique_strength="0" field="code"/>
    <constraint notnull_strength="0" constraints="0" exp_strength="0" unique_strength="0" field="ovrk2015"/>
    <constraint notnull_strength="1" constraints="1" exp_strength="0" unique_strength="0" field="decile"/>
    <constraint notnull_strength="1" constraints="1" exp_strength="0" unique_strength="0" field="quintile"/>
    <constraint notnull_strength="0" constraints="0" exp_strength="0" unique_strength="0" field="hlth2015"/>
    <constraint notnull_strength="0" constraints="0" exp_strength="0" unique_strength="0" field="hlthdecile"/>
    <constraint notnull_strength="0" constraints="0" exp_strength="0" unique_strength="0" field="hlthquintile"/>
    <constraint notnull_strength="0" constraints="0" exp_strength="0" unique_strength="0" field="flow_direction"/>
  </constraints>
  <constraintExpressions>
    <constraint desc="" exp="" field="id"/>
    <constraint desc="" exp="" field="source_oa"/>
    <constraint desc="" exp="" field="target_oa"/>
    <constraint desc="" exp="" field="count"/>
    <constraint desc="" exp="" field="code"/>
    <constraint desc="" exp="" field="ovrk2015"/>
    <constraint desc="" exp="" field="decile"/>
    <constraint desc="" exp="" field="quintile"/>
    <constraint desc="" exp="" field="hlth2015"/>
    <constraint desc="" exp="" field="hlthdecile"/>
    <constraint desc="" exp="" field="hlthquintile"/>
    <constraint desc="" exp="" field="flow_direction"/>
  </constraintExpressions>
  <expressionfields/>
  <attributeactions>
    <defaultAction value="{00000000-0000-0000-0000-000000000000}" key="Canvas"/>
  </attributeactions>
  <attributetableconfig sortOrder="0" sortExpression="" actionWidgetStyle="dropDown">
    <columns>
      <column width="-1" type="field" name="id" hidden="0"/>
      <column width="-1" type="field" name="source_oa" hidden="0"/>
      <column width="-1" type="field" name="target_oa" hidden="0"/>
      <column width="-1" type="field" name="count" hidden="0"/>
      <column width="-1" type="field" name="code" hidden="0"/>
      <column width="-1" type="field" name="ovrk2015" hidden="0"/>
      <column width="-1" type="field" name="decile" hidden="0"/>
      <column width="-1" type="field" name="quintile" hidden="0"/>
      <column width="-1" type="field" name="hlth2015" hidden="0"/>
      <column width="-1" type="field" name="hlthdecile" hidden="0"/>
      <column width="-1" type="field" name="hlthquintile" hidden="0"/>
      <column width="-1" type="actions" hidden="1"/>
      <column width="-1" type="field" name="flow_direction" hidden="0"/>
    </columns>
  </attributetableconfig>
  <conditionalstyles>
    <rowstyles/>
    <fieldstyles/>
  </conditionalstyles>
  <editform tolerant="1"></editform>
  <editforminit/>
  <editforminitcodesource>0</editforminitcodesource>
  <editforminitfilepath></editforminitfilepath>
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
    <field editable="1" name="code"/>
    <field editable="1" name="count"/>
    <field editable="1" name="decile"/>
    <field editable="1" name="flow_direction"/>
    <field editable="1" name="hlth2015"/>
    <field editable="1" name="hlthdecile"/>
    <field editable="1" name="hlthquintile"/>
    <field editable="1" name="id"/>
    <field editable="1" name="ovrk2015"/>
    <field editable="1" name="quintile"/>
    <field editable="1" name="source_oa"/>
    <field editable="1" name="target_oa"/>
  </editable>
  <labelOnTop>
    <field name="code" labelOnTop="0"/>
    <field name="count" labelOnTop="0"/>
    <field name="decile" labelOnTop="0"/>
    <field name="flow_direction" labelOnTop="0"/>
    <field name="hlth2015" labelOnTop="0"/>
    <field name="hlthdecile" labelOnTop="0"/>
    <field name="hlthquintile" labelOnTop="0"/>
    <field name="id" labelOnTop="0"/>
    <field name="ovrk2015" labelOnTop="0"/>
    <field name="quintile" labelOnTop="0"/>
    <field name="source_oa" labelOnTop="0"/>
    <field name="target_oa" labelOnTop="0"/>
  </labelOnTop>
  <widgets/>
  <previewExpression>id</previewExpression>
  <mapTip></mapTip>
  <layerGeometryType>1</layerGeometryType>
</qgis>
